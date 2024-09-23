@implementation ACAccount(AccountMigration)

- (uint64_t)migrationStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BE2FD78];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE2FD78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 5;
  objc_msgSend(a1, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (const)migrationStatusString
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "migrationStatus");
  if ((unint64_t)(v1 - 1) > 4)
    return CFSTR("Attempting");
  else
    return off_24E3704B8[v1 - 1];
}

- (void)setMigrationStatus:()AccountMigration
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, *MEMORY[0x24BE2FD78]);

}

@end
