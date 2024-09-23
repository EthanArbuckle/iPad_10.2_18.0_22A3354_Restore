@implementation VCPMADResource

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("active cost: %d,"), -[VCPMADResource activeCost](self, "activeCost"));
  objc_msgSend(v3, "appendFormat:", CFSTR("inactive cost: %d>"), -[VCPMADResource inactiveCost](self, "inactiveCost"));
  return v3;
}

- (int64_t)activeCost
{
  return 100;
}

- (int64_t)inactiveCost
{
  return 100;
}

- (void)purge
{
  objc_class *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@ does not implement purge", (uint8_t *)&v2, 0xCu);

}

@end
