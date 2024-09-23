@implementation MRTextEditingAttributes

- (MRTextEditingAttributes)initWithTitle:(id)a3 prompt:(id)a4
{
  id v6;
  id v7;
  MRTextEditingAttributes *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *prompt;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTextEditingAttributes;
  v8 = -[MRTextEditingAttributes init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    prompt = v8->_prompt;
    v8->_prompt = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_inputTraits.secureTextEntry)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p \"%@\" secure=%@>"), v5, self, self->_title, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)objc_opt_class();
  return -[MRTextEditingAttributes _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (char)_copyWithZone:(objc_class *)a3 usingConcreteClass:
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (!a1)
    return 0;
  v4 = (char *)objc_alloc_init(a3);
  v5 = objc_msgSend(*(id *)(a1 + 8), "copy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  v7 = objc_msgSend(*(id *)(a1 + 16), "copy");
  v8 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v7;

  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a1 + 24);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v4 + 88) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v4 + 72) = v11;
  *(_OWORD *)(v4 + 56) = v10;
  *(_OWORD *)(v4 + 40) = v9;
  v12 = *(_OWORD *)(a1 + 104);
  v13 = *(_OWORD *)(a1 + 120);
  v14 = *(_OWORD *)(a1 + 136);
  *((_QWORD *)v4 + 19) = *(_QWORD *)(a1 + 152);
  *(_OWORD *)(v4 + 136) = v14;
  *(_OWORD *)(v4 + 120) = v13;
  *(_OWORD *)(v4 + 104) = v12;
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)objc_opt_class();
  return -[MRTextEditingAttributes _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (_MRTextInputTraits)inputTraits
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->PINEntrySeparatorIndexes[7];
  v4 = *(_OWORD *)&self[1].autocapitalizationType;
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[6] = *(_OWORD *)&self->PINEntrySeparatorIndexes[9];
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[8] = v4;
  retstr->PINEntrySeparatorIndexesCount = *(_QWORD *)&self[1].returnKeyType;
  v5 = *(_OWORD *)&self->enablesReturnKeyAutomatically;
  v6 = *(_OWORD *)&self->PINEntrySeparatorIndexes[3];
  *(_OWORD *)&retstr->validTextRange.length = *(_OWORD *)&self->PINEntrySeparatorIndexes[1];
  *(_OWORD *)retstr->PINEntrySeparatorIndexes = v6;
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[2] = *(_OWORD *)&self->PINEntrySeparatorIndexes[5];
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[4] = v3;
  *($5CFEE62CA76FAE445C6F9DBCEE669C70 *)&retstr->autocapitalizationType = self->validTextRange;
  *(_OWORD *)&retstr->returnKeyType = v5;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
