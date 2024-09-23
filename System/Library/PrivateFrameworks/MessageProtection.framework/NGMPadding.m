@implementation NGMPadding

+ (id)padMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  uint64_t v13;
  id v14;
  const __SecRandom *v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  CFTypeRef cf;

  v5 = a3;
  v6 = v5;
  cf = 0;
  if (!v5)
  {
    MPLogAndAssignError(401, a4, CFSTR("Cannot pad a nil message."));
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v7 = SecMPComputePaddingForTransport(objc_msgSend(v5, "length"), 2, (CFErrorRef *)&cf);
  if (cf)
  {
    v8 = (void *)CFCopyDescription(cf);
    CFRelease(cf);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error obtaining the padding length: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(401, a4, v9);

LABEL_7:
    goto LABEL_8;
  }
  if (v7 >= 0x100000000)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The padding configuration suggested is larger than what can be represented in the payload: %li"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(401, a4, v8);
    goto LABEL_7;
  }
  v19 = v7;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v7 + objc_msgSend(v6, "length") + 4);
  v13 = objc_msgSend(v6, "length");
  v14 = objc_retainAutorelease(v6);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 0, v13, objc_msgSend(v14, "bytes"));
  v15 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
  v16 = objc_retainAutorelease(v12);
  v17 = SecRandomCopyBytes(v15, v7, (void *)(objc_msgSend(v16, "mutableBytes") + objc_msgSend(v14, "length")));
  if ((_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("An issue occured while generating random bytes for padding with error: %i"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(4, a4, v18);

    v10 = 0;
  }
  else
  {
    objc_msgSend(v16, "replaceBytesInRange:withBytes:", objc_msgSend(v14, "length") + v7, 4, &v19);
    v10 = v16;
  }

LABEL_9:
  return v10;
}

+ (id)unpadMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "length") > 3)
    {
      v15 = 0;
      objc_msgSend(v6, "getBytes:range:", &v15, objc_msgSend(v6, "length") - 4, 4);
      v7 = v15 + 4;
      if (v7 <= objc_msgSend(v6, "length"))
      {
        v12 = objc_msgSend(v6, "length");
        objc_msgSend(v6, "subdataWithRange:", 0, v12 - v15 - 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v8 = (void *)MEMORY[0x24BDD17C8];
      v13 = objc_msgSend(v6, "length");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("The message is too short (%lu) to contain the indicated padding(%u)."), v13, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The message is too short (%lu) to contain any padding."), objc_msgSend(v6, "length"), v14);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(401, a4, v9);

  }
  else
  {
    MPLogAndAssignError(401, a4, CFSTR("Cannot unpad a nil message."));
  }
  v10 = 0;
LABEL_9:

  return v10;
}

@end
