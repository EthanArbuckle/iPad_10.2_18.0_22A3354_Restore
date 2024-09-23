@implementation NSData(NSData_SNN)

+ (id)dataWithScalar:()NSData_SNN dataType:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v14;
  uint64_t v15;
  uint64_t v17;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(a4)
  {
    case 0:
      LOBYTE(v17) = objc_msgSend(v5, "BOOLValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      objc_msgSend(v5, "floatValue");
      __asm { FCVT            H0, S0 }
      LOWORD(v17) = _S0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 2);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3:
      objc_msgSend(v5, "floatValue");
      LODWORD(v17) = v14;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      objc_msgSend(v5, "doubleValue");
      v17 = v15;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 8);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      LOBYTE(v17) = objc_msgSend(v5, "charValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6:
      LOWORD(v17) = objc_msgSend(v5, "shortValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 2);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7:
      LODWORD(v17) = objc_msgSend(v5, "intValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 8:
      v17 = objc_msgSend(v5, "longValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 8);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9:
      LOBYTE(v17) = objc_msgSend(v5, "unsignedCharValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 10:
      LOWORD(v17) = objc_msgSend(v5, "unsignedShortValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 2);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 11:
      LODWORD(v17) = objc_msgSend(v5, "unsignedIntValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 12:
      v17 = objc_msgSend(v5, "unsignedLongValue");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 8);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v7 = (void *)v8;
      break;
    default:
      break;
  }

  return v7;
}

@end
