@implementation NSMutableData(NSMutableData_SNN)

- (void)appendScalar:()NSMutableData_SNN dataType:
{
  id v6;
  void *v7;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      LOBYTE(v15) = objc_msgSend(v6, "BOOLValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 1);
      break;
    case 2:
      objc_msgSend(v6, "floatValue");
      __asm { FCVT            H0, S0 }
      LOWORD(v15) = _S0;
      objc_msgSend(a1, "appendBytes:length:", &v15, 2);
      break;
    case 3:
      objc_msgSend(v6, "floatValue");
      LODWORD(v15) = v13;
      objc_msgSend(a1, "appendBytes:length:", &v15, 4);
      break;
    case 4:
      objc_msgSend(v6, "doubleValue");
      v15 = v14;
      objc_msgSend(a1, "appendBytes:length:", &v15, 8);
      break;
    case 5:
      LOBYTE(v15) = objc_msgSend(v6, "charValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 1);
      break;
    case 6:
      LOWORD(v15) = objc_msgSend(v6, "shortValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 2);
      break;
    case 7:
      LODWORD(v15) = objc_msgSend(v6, "intValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 4);
      break;
    case 8:
      v15 = objc_msgSend(v6, "longValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 8);
      break;
    case 9:
      LOBYTE(v15) = objc_msgSend(v6, "unsignedCharValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 1);
      break;
    case 10:
      LOWORD(v15) = objc_msgSend(v6, "unsignedShortValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 2);
      break;
    case 11:
      LODWORD(v15) = objc_msgSend(v6, "unsignedIntValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 4);
      break;
    case 12:
      v15 = objc_msgSend(v6, "unsignedLongValue");
      objc_msgSend(a1, "appendBytes:length:", &v15, 8);
      break;
    default:
      break;
  }

}

- (void)appendScalars:()NSMutableData_SNN dataType:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "appendScalar:dataType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
