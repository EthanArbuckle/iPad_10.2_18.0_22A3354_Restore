@implementation _DPWordRecord

- (_DPWordRecord)init
{

  return 0;
}

- (_DPWordRecord)initWithWord:(id)a3 atPosition:(id)a4
{
  id v6;
  id v7;
  _DPWordRecord *v8;
  _DPWordRecord *v9;
  uint64_t v10;
  NSString *word;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_DPWordRecord;
  v8 = -[_DPWordRecord init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wordPosition, a4);
    v10 = objc_msgSend(v6, "copy");
    word = v9->_word;
    v9->_word = (NSString *)v10;

  }
  return v9;
}

+ (id)word:(id)a3 atPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWord:atPosition:", v7, v6);

  return v8;
}

+ (id)bogusCharacter
{
  return CFSTR("∅");
}

- (id)sequenceWithoutPadding
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_DPWordRecord wordPosition](self, "wordPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", &unk_1E96FB028);

  if (v4)
  {
    -[_DPWordRecord word](self, "word");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("∅"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if ((objc_msgSend(v7, "isEqualToString:", &stru_1E95DA470) & 1) == 0)
      v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)sequenceAndFragmentsFrom:(id)a3 fragmentLimit:(unint64_t)a4 fragmentWidth:(unint64_t)a5 puzzlePieceCount:(unint64_t)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  unint64_t v41;
  unint64_t v42;
  void *j;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  NSObject *v52;
  void *v53;
  const char *v54;
  void *v56;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *__upper_bounda;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  unint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v65 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v15, "wordPosition");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        if (v17)
        {
          objc_msgSend(v15, "word");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "wordPosition");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v19);

        }
        else
        {
          ++v12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v20 = objc_msgSend(v9, "count");
  v59 = v20 - v12;
  if (v20 == v12)
  {
    v21 = 0;
    goto LABEL_70;
  }
  v22 = 0x1E0CB3000uLL;
  v23 = a4;
  if (a4)
  {
    v24 = 0;
    v25 = 0;
    v26 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        v25 = v26;
      else
        v24 = v26;
      if (v24)
        v29 = v25 > v24;
      else
        v29 = 0;
      if (v29)
      {
        +[_DPLog framework](_DPLog, "framework");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v70 = v56;
          v71 = 2048;
          v72 = v26;
          v73 = 2048;
          v74 = v24;
          v75 = 2048;
          v76 = v25;
          _os_log_error_impl(&dword_1D3FAA000, v40, OS_LOG_TYPE_ERROR, "%@ : gap in sequence. position(%ld) ; firstMissing(%ld) ; lastPresent(%ld)",
            buf,
            0x2Au);

        }
        v21 = 0;
        goto LABEL_69;
      }
      ++v26;
    }
    while (v26 <= a4);
  }
  v60 = arc4random_uniform(a4) + 1;
  v30 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  if (!a4)
  {
    v61 = 0;
    v31 = 1;
LABEL_44:
    v41 = v22;
    v29 = v23 > v31 - 1;
    v42 = v23 - (v31 - 1);
    if (v29)
    {
      for (j = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy"); a5; --a5)
        objc_msgSend(j, "appendString:", CFSTR("∅"));
      if (a4 == v31 - 1)
      {
        v40 = v61;
      }
      else
      {
        if (v42 <= 1)
          v50 = 1;
        else
          v50 = v42;
        v40 = v61;
        v51 = v60 - v31;
        do
        {
          objc_msgSend(v30, "appendString:", j);
          if (!v51)
          {
            v52 = j;

            v40 = v52;
          }
          --v51;
          --v50;
        }
        while (v50);
      }

      if (v30)
        goto LABEL_51;
    }
    else
    {
      v40 = v61;
      if (v30)
      {
LABEL_51:
        +[_DPWordRecord word:atPosition:](_DPWordRecord, "word:atPosition:", v30, &unk_1E96FB028);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPPuzzleBox puzzleBoxWithDimensionality:](_DPPuzzleBox, "puzzleBoxWithDimensionality:", a6);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
        {
          -[NSObject puzzlePieceFor:](v44, "puzzlePieceFor:", v30);
          __upper_bounda = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), __upper_bounda, v40, a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v41 + 2024), "numberWithUnsignedInteger:", v60);
          v47 = v40;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DPWordRecord word:atPosition:](_DPWordRecord, "word:atPosition:", v46, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = v47;
          v68[0] = v34;
          v68[1] = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
        }
        goto LABEL_67;
      }
    }
    v21 = 0;
    goto LABEL_68;
  }
  v61 = 0;
  v31 = 1;
  while (1)
  {
    v32 = v22;
    objc_msgSend(*(id *)(v22 + 2024), "numberWithUnsignedInteger:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v22 = v32;
      goto LABEL_44;
    }
    v35 = objc_msgSend(v34, "length");
    v36 = v35;
    v37 = a5 - v35;
    if (a5 < v35)
    {
      +[_DPLog framework](_DPLog, "framework");
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v70 = v53;
      v71 = 2048;
      v72 = v36;
      v73 = 2048;
      v74 = v31;
      v75 = 2048;
      v76 = a5;
      v54 = "%@ : Fragment: width=%ld at position=%ld exceeds expected fragmentWidth=%ld";
      goto LABEL_72;
    }
    if (a5 > v35)
      break;
    v38 = v34;
LABEL_35:
    objc_msgSend(v30, "appendString:", v38);
    v23 = a4;
    if (v31 == v60)
    {
      v39 = v38;

      v61 = v39;
    }
    ++v31;

    v22 = v32;
    if (v31 > a4)
      goto LABEL_44;
  }
  if (v31 == v59)
  {
    v38 = (void *)objc_msgSend(v34, "mutableCopy");
    do
    {
      objc_msgSend(v38, "appendString:", CFSTR("∅"));
      --v37;
    }
    while (v37);

    goto LABEL_35;
  }
  +[_DPLog framework](_DPLog, "framework");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    goto LABEL_66;
  NSStringFromSelector(a2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138413058;
  v70 = v53;
  v71 = 2048;
  v72 = v36;
  v73 = 2048;
  v74 = v31;
  v75 = 2048;
  v76 = a5;
  v54 = "%@ : Fragment: with width=%ld at position=%ld less than expected fragmentWidth=%ld";
LABEL_72:
  _os_log_error_impl(&dword_1D3FAA000, v45, OS_LOG_TYPE_ERROR, v54, buf, 0x2Au);

LABEL_66:
  v21 = 0;
  v40 = v61;
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPWordRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _DPWordRecord *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordPosition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("word"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_DPWordRecord initWithWord:atPosition:](self, "initWithWord:atPosition:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_DPWordRecord wordPosition](self, "wordPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wordPosition"));

  -[_DPWordRecord word](self, "word");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("word"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPWordRecord wordPosition](self, "wordPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPWordRecord word](self, "word");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { wordPosition=%@ ; word=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  -[_DPWordRecord word](self, "word");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPWordRecord wordPosition](self, "wordPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "word:atPosition:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToWordRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  if (!a3)
    return 0;
  v4 = a3;
  -[_DPWordRecord wordPosition](self, "wordPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  -[_DPWordRecord word](self, "word");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "word");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "isEqualToString:", v9);
  return v7 & v4;
}

- (BOOL)isEqual:(id)a3
{
  _DPWordRecord *v4;
  _DPWordRecord *v5;
  BOOL v6;

  v4 = (_DPWordRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPWordRecord isEqualToWordRecord:](self, "isEqualToWordRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_DPWordRecord word](self, "word");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPWordRecord wordPosition](self, "wordPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSNumber)wordPosition
{
  return self->_wordPosition;
}

- (NSString)word
{
  return self->_word;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_wordPosition, 0);
}

@end
