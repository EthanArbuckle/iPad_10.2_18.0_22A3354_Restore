@implementation CUPairedPeer(APPairingClientCoreUtils)

- (id)patchedPairedPeerWithPeerInfo:()APPairingClientCoreUtils
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D1B3E0]);
  objc_msgSend(v5, "setAcl:", objc_msgSend(a1, "acl"));
  objc_msgSend(v5, "setAltIRK:", objc_msgSend(a1, "altIRK"));
  objc_msgSend(v5, "setIdentifier:", objc_msgSend(a1, "identifier"));
  objc_msgSend(v5, "setModel:", objc_msgSend(a1, "model"));
  objc_msgSend(v5, "setName:", objc_msgSend(a1, "name"));
  objc_msgSend(v5, "setPublicKey:", objc_msgSend(a1, "publicKey"));
  v6 = (id)objc_msgSend((id)objc_msgSend(a1, "info"), "mutableCopy");
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
    objc_msgSend(v6, "addEntriesFromDictionary:", a3);
  objc_msgSend(v5, "setInfo:", v6);
  if (IsAppleInternalBuild()
    && gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v5;
}

@end
