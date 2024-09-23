uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

 a6;
  if (dword_25414C290 <= 10 && (dword_25414C290 != -1 || _LogCategory_Initialize()))
  {
    if ((a4 - 1) > 3)
      v11 = "?";
    else
      v11 = off_24FFBC5E0[a4 - 1];
    v21 = v10;
    v22 = v23;
    v20 = v11;
    LogPrintF();
  }
  if (v23)
    v12 = v23;
  else
    v12 = v10;
  v13 = v12;
  objc_msgSend(v13, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if (v16)
  {
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a4)
    {
      case 1:
        v19 = *MEMORY[0x24BE047F0];
        if (!objc_msgSend(v23, "aa_isAccountClass:", *MEMORY[0x24BE047F0]))
          goto LABEL_43;
        if (dword_25414C290 > 30 || dword_25414C290 == -1 && !_LogCategory_Initialize())
          goto LABEL_42;
        v20 = (const char *)v23;
        break;
      case 2:
        v19 = *MEMORY[0x24BE047F0];
        if (objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x24BE047F0])
          && (objc_msgSend(v23, "aa_isAccountClass:", v19) & 1) == 0
          && objc_msgSend(v17, "isEqual:", v18))
        {
          if (dword_25414C290 > 30 || dword_25414C290 == -1 && !_LogCategory_Initialize())
            goto LABEL_40;
          v20 = (const char *)v13;
LABEL_20:
          LogPrintF();
LABEL_40:
          objc_msgSend(MEMORY[0x24BE7CBE0], "primaryAccountSignedOut", v20, v21, v22);
          goto LABEL_43;
        }
        if (!objc_msgSend(v23, "aa_isAccountClass:", v19, v20, v21, v22)
          || (objc_msgSend(v10, "aa_isAccountClass:", v19) & 1) != 0
          || !objc_msgSend(v17, "isEqual:", v18))
        {
          goto LABEL_43;
        }
        if (dword_25414C290 > 30 || dword_25414C290 == -1 && !_LogCategory_Initialize())
        {
LABEL_42:
          objc_msgSend(MEMORY[0x24BE7CBE0], "primaryAccountSignedIn", v20);
LABEL_43:
          if ((objc_msgSend(v23, "aa_isAccountClass:", v19, v20) & 1) != 0
            || objc_msgSend(v10, "aa_isAccountClass:", v19))
          {
            if (dword_25414C290 <= 30 && (dword_25414C290 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            notify_post("com.apple.rapport.primaryAccountChanged");
          }

          goto LABEL_51;
        }
        v20 = (const char *)v23;
        break;
      case 3:
        v19 = *MEMORY[0x24BE047F0];
        if (!objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x24BE047F0]))
          goto LABEL_43;
        if (dword_25414C290 > 30 || dword_25414C290 == -1 && !_LogCategory_Initialize())
          goto LABEL_40;
        v20 = (const char *)v13;
        goto LABEL_20;
      default:
        v19 = *MEMORY[0x24BE047F0];
        goto LABEL_43;
    }
    LogPrintF();
    goto LABEL_42;
  }
LABEL_51:

}

@end
