@implementation NSData(Archive)

- (id)cdp_unarchivedRoot
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", a1, 0);
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeObjectOfClasses:forKey:", v4, CFSTR("root"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "finishDecoding");
  return v5;
}

- (void)cdp_unarchivedRoot
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Failed to parse data: %@ - %@\", buf, 0x16u);

}

@end
