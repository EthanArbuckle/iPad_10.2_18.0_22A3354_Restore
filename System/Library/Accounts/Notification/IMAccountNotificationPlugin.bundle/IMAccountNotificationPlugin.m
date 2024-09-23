uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a4 == 1)
  {
    v6 = (void *)MEMORY[0x24BE0AC98];
    v7 = a3;
    objc_msgSend(v6, "sharedInstance");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountPropertyForKey:", CFSTR("altDSID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v13, "authKitAccountWithAltDSID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_msgSend(v13, "securityLevelForAccount:", v9);
        if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "postNotificationName:object:userInfo:", *MEMORY[0x24BE50CF0], *MEMORY[0x24BE50CF0], 0);

        }
        if (v10 == 4)
        {
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postNotificationName:object:userInfo:", *MEMORY[0x24BE50CE8], *MEMORY[0x24BE50CE8], 0);

        }
      }
    }
    else
    {
      v9 = 0;
    }

  }
}

@end
