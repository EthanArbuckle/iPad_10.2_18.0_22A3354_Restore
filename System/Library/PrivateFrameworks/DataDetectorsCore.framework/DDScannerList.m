@implementation DDScannerList

- (void)activateScanner:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (v4)
    {
      objc_msgSend(v4, "addObject:", v3);
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

    }
    v3 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScanners, 0);
  objc_storeStrong((id *)&self->_scannerCache, 0);
  objc_storeStrong((id *)&self->_waitQueue, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_hash, 0);
}

@end
