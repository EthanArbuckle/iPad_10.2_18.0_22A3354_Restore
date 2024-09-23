@implementation APPairingClientCoreUtilsCreateUnpairedPeersFromGroupInfo

uint64_t __APPairingClientCoreUtilsCreateUnpairedPeersFromGroupInfo_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "identifier"));
}

void __APPairingClientCoreUtilsCreateUnpairedPeersFromGroupInfo_block_invoke_2(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  uint64_t v6;
  void *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFStringRef v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (CFEqual(cf1, CFSTR("groupID")))
  {
LABEL_23:
    v13 = 0;
    v7 = 0;
    goto LABEL_18;
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", cf1);
  if (!v6)
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_23;
  }
  v7 = (void *)v6;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) != 0)
  {
LABEL_15:
    v13 = 0;
    goto LABEL_18;
  }
  if (!a3 || (v8 = CFGetTypeID(a3), v8 != CFDataGetTypeID()))
  {
    v9 = CFGetTypeID(a3);
    v10 = CFCopyTypeIDDescription(v9);
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v10)
      CFRelease(v10);
    goto LABEL_15;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0D1B3E0]);
  objc_msgSend(v13, "setIdentifier:", v7);
  objc_msgSend(v13, "setPublicKey:", a3);
  if (gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13, v13, cf1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13, v11, v12);
  }
LABEL_18:

}

@end
