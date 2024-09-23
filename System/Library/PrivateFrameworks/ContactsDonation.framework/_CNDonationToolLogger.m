@implementation _CNDonationToolLogger

- (_CNDonationToolLogger)init
{
  _CNDonationToolLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationToolLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationToolLogger;
  v2 = -[_CNDonationToolLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "tool");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)commandArgs:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNDonationToolLogger log_t](self, "log_t");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_209C22000, v6, OS_LOG_TYPE_INFO, "Command invoked with args: [ %{public}@ ]", (uint8_t *)&v7, 0xCu);
  }

}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_t, 0);
}

@end
