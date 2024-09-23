@implementation PKMathVariable

+ (id)variablesForTokens:(void *)a3 item:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        if (objc_msgSend(v11, "type") == 1)
        {
          objc_msgSend(v5, "expression");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "characterRange");
          if (v13 + v14 <= (unint64_t)objc_msgSend(v12, "length"))
          {
            v16 = objc_msgSend(v11, "characterRange");
            objc_msgSend(v12, "substringWithRange:", v16, v17);
            v15 = objc_claimAutoreleasedReturnValue();
            v18 = objc_opt_new();
            -[NSObject doubleValue](v15, "doubleValue");
            if (v18)
              *(_QWORD *)(v18 + 24) = v19;
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v18)
            {
              objc_storeStrong((id *)(v18 + 8), v20);

              *(_QWORD *)(v18 + 40) = objc_msgSend(v11, "characterRange");
              *(_QWORD *)(v18 + 48) = v22;
            }
            else
            {

              objc_msgSend(v11, "characterRange");
            }
            v23 = objc_msgSend(v11, "characterRange");
            -[PKMathRecognitionItem _strokeIndexesForCharacterRange:]((uint64_t)v5, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_storeStrong((id *)(v18 + 32), v25);

            objc_msgSend(v29, "addObject:", v18);
          }
          else
          {
            v15 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Invalid character range detected for token", buf, 2u);
            }
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v8 = v26;
    }
    while (v26);
  }

  v27 = (void *)objc_msgSend(v29, "copy");
  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
