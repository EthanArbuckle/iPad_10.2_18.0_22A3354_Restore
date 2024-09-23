@implementation SGCNContactIdentifierCollection

- (SGCNContactIdentifierCollection)init
{
  SGCNContactIdentifierCollection *v2;
  uint64_t v3;
  NSMutableData *optimizedBuffer;
  uint64_t v5;
  NSMutableArray *unoptimizedIdentifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGCNContactIdentifierCollection;
  v2 = -[SGCNContactIdentifierCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    optimizedBuffer = v2->_optimizedBuffer;
    v2->_optimizedBuffer = (NSMutableData *)v3;

    v5 = objc_opt_new();
    unoptimizedIdentifiers = v2->_unoptimizedIdentifiers;
    v2->_unoptimizedIdentifiers = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)addCNContactIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SGCNContactIdentifierCollection _optimizeAndAddCNContactIdentifier:](self, "_optimizeAndAddCNContactIdentifier:"))-[NSMutableArray addObject:](self->_unoptimizedIdentifiers, "addObject:", v4);

}

- (BOOL)_optimizeAndAddCNContactIdentifier:(id)a3
{
  id v4;
  BOOL v6;
  uint64_t v8;
  int v9;
  _QWORD v10[2];
  char in[16];
  _DWORD v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") == 45)
  {
    *(_OWORD *)in = 0u;
    memset(v12, 0, 30);
    if (objc_msgSend(v4, "getCString:maxLength:encoding:", in, 46, 1))
    {
      if (*(_QWORD *)&v12[5] == 0x6F7372655042413ALL && LOBYTE(v12[7]) == 110)
      {
        v8 = 0;
        while (in[v8] - 97 >= 0x1A)
        {
          if (++v8 == 36)
          {
            LOBYTE(v12[5]) = 0;
            v10[0] = 0;
            v10[1] = 0;
            v9 = uuid_parse(in, (unsigned __int8 *)v10);
            v6 = v9 == 0;
            if (!v9)
              -[NSMutableData appendBytes:length:](self->_optimizedBuffer, "appendBytes:length:", v10, 16);
            goto LABEL_8;
          }
        }
      }
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (id)proxyArray
{
  NSMutableData *v3;
  unint64_t v4;
  void *v5;
  NSMutableData *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];
  NSMutableData *v12;
  unint64_t v13;

  v3 = self->_optimizedBuffer;
  v4 = -[NSMutableData length](v3, "length");
  v5 = (void *)MEMORY[0x1E0C99D20];
  v10[4] = v4 >> 4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SGCNContactIdentifierCollection_proxyArray__block_invoke;
  v11[3] = &unk_1E7DAE060;
  v12 = v3;
  v13 = v4 >> 4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SGCNContactIdentifierCollection_proxyArray__block_invoke_2;
  v10[3] = &__block_descriptor_40_e5_Q8__0l;
  v6 = v3;
  objc_msgSend(v5, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v11, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_proxyArrayByAppendingArray:", self->_unoptimizedIdentifiers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unoptimizedIdentifiers, 0);
  objc_storeStrong((id *)&self->_optimizedBuffer, 0);
}

id __45__SGCNContactIdentifierCollection_proxyArray__block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  char out[56];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 <= a2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%tu out of range (count %tu)"), a2, v4);
  memset(out, 0, 45);
  uuid_unparse_upper((const unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes") + 16 * a2), out);
  qmemcpy(&out[36], ":ABPerson", 9);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", out, 45, 1);
}

uint64_t __45__SGCNContactIdentifierCollection_proxyArray__block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end
