uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

d v6;

  if ((a4 & 0xFFFFFFFD) == 1)
  {
    objc_msgSend(a5, "databaseBackupActivity", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleBackup");

  }
}

@end
