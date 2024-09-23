@implementation _MNLPRPlate

- (void)enumerateCharsUsingBlock:(uint64_t)a1
{
  void (**v3)(id, void *, unint64_t, _BYTE *);
  unint64_t v4;
  void *v5;
  char v6;

  v3 = a2;
  if (a1)
  {
    v4 = 0;
    v6 = 0;
    do
    {
      if (v4 >= objc_msgSend(*(id *)(a1 + 8), "count"))
        break;
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v5, v4, &v6);

      ++v4;
    }
    while (!v6);
  }

}

- (void)charForTarget:(void *)a3 alphabetics:(void *)a4 numerics:(void *)a5 result:
{
  id v9;
  id v10;
  void (**v11)(id, void *, unint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v19, "charIndex");
  v13 = objc_msgSend(*(id *)(a1 + 8), "count");
  if (v12 < 0)
  {
    if (v13 >= 1)
    {
      v17 = v13 + 1;
      v18 = -1;
      do
      {
        v15 = v17 - 2;
        objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v17 - 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_MNLPRPlateCharacter isOfType:alphabetics:numerics:]((uint64_t)v16, objc_msgSend(v19, "type"), v9, v10))
        {
          if (v18 == (int)objc_msgSend(v19, "charIndex"))
          {
LABEL_16:
            v11[2](v11, v16, v15);

            break;
          }
          --v18;
        }

        --v17;
      }
      while (v17 >= 2);
    }
  }
  else if (v13)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_MNLPRPlateCharacter isOfType:alphabetics:numerics:]((uint64_t)v16, objc_msgSend(v19, "type"), v9, v10))
      {
        if (v14 == (int)objc_msgSend(v19, "charIndex"))
          goto LABEL_16;
        ++v14;
      }

      ++v15;
    }
    while (v15 < objc_msgSend(*(id *)(a1 + 8), "count"));
  }

}

- (uint64_t)charIndexForTarget:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55___MNLPRPlate_charIndexForTarget_alphabetics_numerics___block_invoke;
    v11[3] = &unk_1E61D2D48;
    v11[4] = &v12;
    -[_MNLPRPlate charForTarget:alphabetics:numerics:result:](a1, v7, v8, v9, v11);
    a1 = v13[3];
    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

- (id)charMatching:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49___MNLPRPlate_charMatching_alphabetics_numerics___block_invoke;
    v11[3] = &unk_1E61D2D48;
    v11[4] = &v12;
    -[_MNLPRPlate charForTarget:alphabetics:numerics:result:]((uint64_t)a1, v7, v8, v9, v11);
    a1 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> \"%@\"), v5, self, self->_chars);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chars, 0);
}

@end
