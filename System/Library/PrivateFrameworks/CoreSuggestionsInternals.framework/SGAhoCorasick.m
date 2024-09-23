@implementation SGAhoCorasick

- (SGAhoCorasick)initWithBytecode:(id)a3
{
  id v6;
  SGAhoCorasick *v7;
  SGAhoCorasick *v8;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGAhoCorasick.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytecode"));

  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGAhoCorasick.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytecode.length > 0"));

  }
  if ((objc_msgSend(v6, "length") & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGAhoCorasick.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytecode.length % sizeof(op_t) == 0"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SGAhoCorasick;
  v7 = -[SGAhoCorasick init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bytecode, a3);
    v8->_endPtr = (unint64_t)objc_msgSend(v6, "length") >> 2;
  }

  return v8;
}

- (BOOL)existsInString:(id)a3
{
  id v5;
  unsigned __int16 *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int v12;
  int64_t v13;
  CFIndex v14;
  UniChar *v15;
  int64_t v16;
  UniChar v17;
  uint64_t endPtr;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v28;
  BOOL v29;
  void *v31;
  id v32;
  CFIndex v33;
  UniChar buffer[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CFStringRef theString;
  UniChar *v43;
  const char *v44;
  uint64_t v45;
  CFIndex v46;
  int64_t v47;
  int64_t v48;
  CFRange v49;

  v5 = a3;
  if (!v5)
  {
    v29 = 0;
    goto LABEL_57;
  }
  v6 = -[NSData bytes](self->_bytecode, "bytes");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGAhoCorasick.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytecode"));

  }
  v7 = (__CFString *)v5;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v29 = 0;
    goto LABEL_56;
  }
  v32 = v5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  *(_OWORD *)buffer = 0u;
  v35 = 0u;
  Length = CFStringGetLength(v7);
  theString = v7;
  v45 = 0;
  v46 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v43 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v47 = 0;
  v48 = 0;
  v44 = CStringPtr;
  if (Length < 1)
  {
LABEL_54:
    v29 = 0;
    goto LABEL_55;
  }
  LOWORD(v12) = 0;
  v13 = 0;
  v33 = Length;
  while (1)
  {
    v14 = v46;
    if (v46 <= v13)
    {
      v17 = 0;
    }
    else
    {
      v15 = v43;
      if (v43)
      {
        v16 = v45 + v13;
LABEL_12:
        v17 = v15[v16];
        goto LABEL_14;
      }
      if (!v44)
      {
        v26 = v47;
        if (v48 <= v13 || v47 > v13)
        {
          v28 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v28 = 0;
          if (v28 + 64 < v46)
            v14 = v28 + 64;
          v47 = v28;
          v48 = v14;
          v49.location = v45 + v28;
          v49.length = v14 - v28;
          CFStringGetCharacters(theString, v49, buffer);
          v26 = v47;
        }
        v16 = v13 - v26;
        v15 = buffer;
        goto LABEL_12;
      }
      v17 = v44[v45 + v13];
    }
LABEL_14:
    endPtr = self->_endPtr;
    if (self->_endPtr)
      break;
LABEL_34:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SGAhoCorasickMaxIter"), CFSTR("Exceeded iteration limit"));
LABEL_39:
    if (++v13 == v33)
      goto LABEL_54;
  }
  v19 = 0;
  while (1)
  {
    if ((unsigned __int16)v12 >= (unsigned __int16)endPtr)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SGAhoCorasickBoundsCheck"), CFSTR("Node %u beyond bound %u"), (unsigned __int16)v12, endPtr);
    v20 = v6[2 * (unsigned __int16)v12 + 1];
    v21 = 1;
    if (v20 >= 2)
    {
      do
      {
        v22 = self->_endPtr;
        if (v22 <= (unsigned __int16)(v12 + ((v20 + v21) >> 1)))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SGAhoCorasickBoundsCheck"), CFSTR("Node %u beyond bound %u"), (unsigned __int16)(v12 + ((v20 + v21) >> 1)), v22);
        if (v6[2 * (unsigned __int16)(v12 + ((v20 + v21) >> 1))] >= v17)
          v20 = (v20 + v21) >> 1;
        else
          v21 = ((v20 + v21) >> 1) + 1;
      }
      while (v21 < v20);
    }
    if (v21 == v20)
    {
      v23 = v12 + v21;
      v24 = self->_endPtr;
      if (v24 <= v23)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SGAhoCorasickBoundsCheck"), CFSTR("Node %u beyond bound %u"), v23, v24);
      if (v6[2 * v23] == v17)
        break;
    }
    if (!(_WORD)v12)
    {
      LOWORD(v12) = 0;
      goto LABEL_39;
    }
    v25 = self->_endPtr;
    if (v25 <= (unsigned __int16)v12)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SGAhoCorasickBoundsCheck"), CFSTR("Node %u beyond bound %u"), (unsigned __int16)v12, v25);
    v12 = v6[2 * (unsigned __int16)v12];
    if (v12 == 0xFFFF)
      goto LABEL_53;
    ++v19;
    endPtr = self->_endPtr;
    if (v19 >= endPtr)
      goto LABEL_34;
  }
  v12 = v6[2 * v23 + 1];
  if (v12 != 0xFFFF)
    goto LABEL_39;
LABEL_53:
  v29 = 1;
LABEL_55:
  v5 = v32;
LABEL_56:

LABEL_57:
  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytecode, 0);
}

@end
