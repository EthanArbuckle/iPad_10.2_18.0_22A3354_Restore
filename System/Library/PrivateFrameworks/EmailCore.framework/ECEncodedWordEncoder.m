@implementation ECEncodedWordEncoder

- (ECEncodedWordEncoder)initWithString:(id)a3 stringEncoding:(unint64_t)a4 language:(id)a5
{
  id v9;
  id v10;
  ECEncodedWordEncoder *v11;
  uint64_t v12;
  NSString *string;
  uint64_t v14;
  NSString *language;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string.length"));

  }
  if ((objc_msgSend(v9, "canBeConvertedToEncoding:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[string canBeConvertedToEncoding:stringEncoding]"));

  }
  v19.receiver = self;
  v19.super_class = (Class)ECEncodedWordEncoder;
  v11 = -[ECEncodedWordEncoder init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v11->_stringEncoding = a4;
    v14 = objc_msgSend(v10, "copy");
    language = v11->_language;
    v11->_language = (NSString *)v14;

    v11->_encodedWordEncoding = 0;
  }

  return v11;
}

- (ECEncodedWordEncoder)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 432, CFSTR("Invalid initializer called, returning nil"));

  return 0;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = -[ECEncodedWordEncoder stringEncoding](self, "stringEncoding");
  -[ECEncodedWordEncoder string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ECEncodedWordEncoder;
  -[ECEncodedWordEncoder description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ECConvertEncodingToCharacterSetName(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECEncodedWordEncoder language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %lu (%@*%@) <%@: %p>"), v6, v3, v7, v8, objc_opt_class(), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)minimumLengthOfEncodedWord
{
  -[ECEncodedWordEncoder _prepareForEncoding](self, "_prepareForEncoding");
  return -[ECEncodedWordEncoder singleEncodedWordLength](self, "singleEncodedWordLength");
}

- (void)_prepareForEncoding
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (!-[ECEncodedWordEncoder encodedWordEncoding](self, "encodedWordEncoding"))
  {
    v4 = -[ECEncodedWordEncoder stringEncoding](self, "stringEncoding");
    -[ECEncodedWordEncoder string](self, "string");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v21, "lengthOfBytesUsingEncoding:", v4);
    if (v5 == 3 * (v5 / 3))
      v6 = 4 * (v5 / 3);
    else
      v6 = 4 * (v5 / 3) + 4;
    if (ECEncodingIsASCIISuperset(v4))
    {
      objc_msgSend(v21, "dataUsingEncoding:", v4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = -[ECEncodedWordEncoder _lengthOfQEncodedTextForBytes:length:](self, "_lengthOfQEncodedTextForBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      if (v8 > v6)
        v9 = 1;
      else
        v9 = 2;
      if (v8 <= v6)
        v10 = 1;
      else
        v10 = 4;
      if (v8 < v6)
        v6 = v8;
    }
    else
    {
      v7 = 0;
      v10 = 4;
      v9 = 1;
    }
    -[ECEncodedWordEncoder setEncodedWordEncoding:](self, "setEncodedWordEncoding:", v9);
    ECConvertEncodingToCharacterSetName(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 1);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 489, CFSTR("Character set %@ is not encodable in ASCII"), v11);

    }
    -[ECEncodedWordEncoder setCharacterSet:](self, "setCharacterSet:", v11);
    -[ECEncodedWordEncoder language](self, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 1);
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 496, CFSTR("Language %@ is not encodable in ASCII"), v14);

      }
      v16 = v15 + 1;
    }
    else
    {
      v16 = 0;
    }
    v17 = v12 + v16 + 5;
    if ((unint64_t)(v10 + v17 - 74) <= 0xFFFFFFFFFFFFFFB3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 507, CFSTR("Impossible to make an encoded-word with character set \"%@\" and language \"%@\"), v11, v14);

    }
    if (v6 + v17 + 2 <= 0x4B)
      -[ECEncodedWordEncoder setDecodedText:](self, "setDecodedText:", v7);
    -[ECEncodedWordEncoder setSingleEncodedWordLength:](self, "setSingleEncodedWordLength:", v6 + v17 + 2);

  }
}

- (unint64_t)encodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  id v7;
  int64_t v8;
  unint64_t v9;
  void *v10;

  v7 = a3;
  -[ECEncodedWordEncoder _prepareForEncoding](self, "_prepareForEncoding");
  v8 = -[ECEncodedWordEncoder encodedWordEncoding](self, "encodedWordEncoding");
  if (v8 == 1)
  {
    v9 = -[ECEncodedWordEncoder _bEncodeToHeaderData:currentLineLength:](self, "_bEncodeToHeaderData:currentLineLength:", v7, a4);
  }
  else
  {
    if (v8 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 533, CFSTR("Could not determine encoded-word encoding"));

      goto LABEL_7;
    }
    v9 = -[ECEncodedWordEncoder _qEncodeToHeaderData:currentLineLength:](self, "_qEncodeToHeaderData:currentLineLength:", v7, a4);
  }
  a4 = v9;
LABEL_7:

  return a4;
}

- (unint64_t)_writeEncodedWordPreambleToBuffer:(char *)a3 length:(unint64_t)a4
{
  char *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *v14;
  _BYTE *v15;
  int64_t v16;
  char v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  *(_WORD *)a3 = 16189;
  v8 = a3 + 2;
  -[ECEncodedWordEncoder characterSet](self, "characterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v10 = a4 - 2;
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, a4 - 2, &v21, 1, 2, 0, objc_msgSend(v9, "length"), 0);
  v11 = v21;
  -[ECEncodedWordEncoder language](self, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = &v8[v11];
  if (v12)
  {
    *v14 = 42;
    v15 = v14 + 1;
    v20 = 0;
    objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v15, v10 + ~v11, &v20, 1, 2, 0, objc_msgSend(v12, "length"), 0);
    v14 = &v15[v20];
  }
  *v14 = 63;
  v16 = -[ECEncodedWordEncoder encodedWordEncoding](self, "encodedWordEncoding");
  if (v16 == 1)
  {
    v17 = 66;
  }
  else
  {
    if (v16 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 588, CFSTR("Could not determine encoded-word encoding"));

      goto LABEL_9;
    }
    v17 = 81;
  }
  v14[1] = v17;
LABEL_9:
  v14[2] = 63;

  return v14 - a3 + 3;
}

- (unint64_t)_bEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  char *__ptr32 *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  ECEncodedWordEncoder *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _WORD *v50;
  char *v51;
  unint64_t v53;
  __int128 v54;
  ECEncodedWordEncoder *v55;
  uint64_t v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  _OWORD __src[5];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 76 - a4;
  if (76 - a4 >= 0x4B)
    v7 = 75;
  if (a4 >= 0x4C)
    v8 = 0;
  else
    v8 = v7;
  v9 = -[ECEncodedWordEncoder singleEncodedWordLength](self, "singleEncodedWordLength");
  if (v8 >= v9)
  {
    v25 = objc_msgSend(v6, "length");
    objc_msgSend(v6, "increaseLengthBy:", v9);
    v26 = objc_msgSend(objc_retainAutorelease(v6), "mutableBytes") + v25;
    v27 = -[ECEncodedWordEncoder _writeEncodedWordPreambleToBuffer:length:](self, "_writeEncodedWordPreambleToBuffer:length:", v26, v9);
    v28 = self;
    -[ECEncodedWordEncoder decodedText](self, "decodedText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      -[ECEncodedWordEncoder string](v28, "string");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dataUsingEncoding:", -[ECEncodedWordEncoder stringEncoding](v28, "stringEncoding"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v29, "base64EncodedDataWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");
    v33 = v26 + v27;
    objc_msgSend(v31, "getBytes:length:", v33, v32);
    *(_WORD *)(v33 + v32) = 15679;
    v34 = v9 + a4;

    goto LABEL_37;
  }
  memset(__src, 0, 75);
  v55 = self;
  v10 = -[ECEncodedWordEncoder _writeEncodedWordPreambleToBuffer:length:](self, "_writeEncodedWordPreambleToBuffer:length:", __src, 75);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 3 * ((73 - v10) >> 2));
  -[ECEncodedWordEncoder string](v55, "string");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[ECEncodedWordEncoder stringEncoding](v55, "stringEncoding");
  v12 = objc_msgSend(v58, "length");
  *(_QWORD *)&v61 = 0;
  *((_QWORD *)&v61 + 1) = v12;
  v13 = &off_1B9B33000;
  if (v8 >= v10 + 6)
  {
    v53 = (v8 - v10 - 2) >> 2;
    objc_msgSend(v11, "setLength:", 3 * v53);
    v60 = 0;
    v14 = objc_retainAutorelease(v11);
    v15 = objc_msgSend(v14, "mutableBytes");
    v59 = xmmword_1B9B337F0;
    v16 = v61;
    v17 = v58;
    if (objc_msgSend(v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v15, 3 * v53, &v60, v57, 2, v61, &v59))
    {
      if (!*((_QWORD *)&v59 + 1))
        goto LABEL_14;
      v18 = objc_msgSend(v17, "rangeOfComposedCharacterSequenceAtIndex:", (_QWORD)v59);
      if (v18 >= (unint64_t)v59)
        goto LABEL_14;
      if (v18 > v16)
      {
        v62 = xmmword_1B9B337F0;
        if ((objc_msgSend(v17, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v15, 3 * v53, &v60, v57, 2, v16, v18 - v16, &v62) & 1) != 0)
        {
          v19 = v59 - v62 + *((_QWORD *)&v59 + 1);
          *(_QWORD *)&v59 = v62;
          *((_QWORD *)&v59 + 1) = v19;
LABEL_14:

          objc_msgSend(v14, "setLength:", v60);
          objc_msgSend(v14, "base64EncodedDataWithOptions:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");
          v22 = objc_msgSend(v6, "length");
          objc_msgSend(v6, "increaseLengthBy:", v10 + v21 + 2);
          v23 = (char *)(objc_msgSend(objc_retainAutorelease(v6), "mutableBytes") + v22);
          memcpy(v23, __src, v10);
          v24 = &v23[v10];
          objc_msgSend(v20, "getBytes:length:", v24, v21);
          *(_WORD *)&v24[v21] = 15679;
          v61 = v59;
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL getBytesFromStringWithoutSplittingComposedCharacters(NSString * _Nonnull __strong, void * _Nonnull, NSUInteger, NSUInteger * _Nonnull, NSStringEncoding, NSRange, NSRangePointer _Nonnull, BOOL * _Nonnull)");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("ECEncodedWord.m"), 745, CFSTR("Failed to get bytes from string"));

        v37 = v59 - v62 + *((_QWORD *)&v59 + 1);
        *(_QWORD *)&v59 = v62;
        *((_QWORD *)&v59 + 1) = v37;
      }
    }

    v13 = &off_1B9B33000;
    if (v53 < (73 - v10) >> 2)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("ECEncodedWord.m"), 678, CFSTR("Failed to get bytes from string"));
LABEL_15:

    v13 = &off_1B9B33000;
LABEL_21:
    v12 = *((_QWORD *)&v61 + 1);
  }
  if (v12)
  {
    v54 = *((_OWORD *)v13 + 127);
    while (1)
    {
      objc_msgSend(v11, "setLength:", 3 * ((73 - v10) >> 2));
      *(_QWORD *)&v59 = 0;
      v38 = objc_retainAutorelease(v11);
      v39 = objc_msgSend(v38, "mutableBytes");
      v40 = v61;
      v41 = v58;
      if (!objc_msgSend(v41, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v39, 3 * ((73 - v10) >> 2), &v59, v57, 2, v40, &v61))goto LABEL_32;
      if (!*((_QWORD *)&v61 + 1))
        goto LABEL_33;
      v42 = objc_msgSend(v41, "rangeOfComposedCharacterSequenceAtIndex:", (_QWORD)v61);
      if (v42 >= (unint64_t)v61)
        goto LABEL_33;
      if (v42 <= (unint64_t)v40)
      {

        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("ECEncodedWord.m"), 692, CFSTR("Can't make encoded-word without splitting a composed character sequence"));
      }
      else
      {
        v62 = v54;
        if ((objc_msgSend(v41, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v39, 3 * ((73 - v10) >> 2), &v59, v57, 2, (_QWORD)v40, v42 - (_QWORD)v40, &v62) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL getBytesFromStringWithoutSplittingComposedCharacters(NSString * _Nonnull __strong, void * _Nonnull, NSUInteger, NSUInteger * _Nonnull, NSStringEncoding, NSRange, NSRangePointer _Nonnull, BOOL * _Nonnull)");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("ECEncodedWord.m"), 745, CFSTR("Failed to get bytes from string"));

          v46 = v61 - v62 + *((_QWORD *)&v61 + 1);
          *(_QWORD *)&v61 = v62;
          *((_QWORD *)&v61 + 1) = v46;
LABEL_32:

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("ECEncodedWord.m"), 691, CFSTR("Failed to get bytes from string"));
          goto LABEL_33;
        }
        v43 = v61 - v62 + *((_QWORD *)&v61 + 1);
        *(_QWORD *)&v61 = v62;
        *((_QWORD *)&v61 + 1) = v43;
      }
LABEL_33:

      objc_msgSend(v38, "setLength:", (_QWORD)v59);
      objc_msgSend(v38, "base64EncodedDataWithOptions:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "length");
      v49 = objc_msgSend(v6, "length");
      objc_msgSend(v6, "increaseLengthBy:", v10 + 4 + v48);
      v50 = (_WORD *)(objc_msgSend(objc_retainAutorelease(v6), "mutableBytes") + v49);
      *v50++ = 8202;
      memcpy(v50, __src, v10);
      v51 = (char *)v50 + v10;
      objc_msgSend(v47, "getBytes:length:", v51, v48);
      *(_WORD *)&v51[v48] = 15679;

      if (!*((_QWORD *)&v61 + 1))
      {
        v34 = v10 + v48 + 3;
        goto LABEL_36;
      }
    }
  }
  v34 = 0;
LABEL_36:

LABEL_37:
  return v34;
}

- (unint64_t)_qEncodeToHeaderData:(id)a3 currentLineLength:(unint64_t)a4
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _WORD *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  size_t v33;
  _WORD *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  SEL v39;
  uint64_t *v40;
  size_t v41;
  id v42;
  char v43;
  __int128 v44;
  __int128 v45;
  size_t v46;
  unint64_t v47;
  size_t v48;
  uint64_t v49;
  _OWORD __src[5];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 76 - a4;
  if (76 - a4 >= 0x4B)
    v8 = 75;
  if (a4 >= 0x4C)
    v9 = 0;
  else
    v9 = v8;
  v10 = -[ECEncodedWordEncoder singleEncodedWordLength](self, "singleEncodedWordLength");
  if (v9 >= v10)
  {
    v21 = objc_msgSend(v7, "length");
    objc_msgSend(v7, "increaseLengthBy:", v10);
    v22 = objc_msgSend(objc_retainAutorelease(v7), "mutableBytes") + v21;
    v23 = -[ECEncodedWordEncoder _writeEncodedWordPreambleToBuffer:length:](self, "_writeEncodedWordPreambleToBuffer:length:", v22, v10);
    -[ECEncodedWordEncoder decodedText](self, "decodedText");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[ECEncodedWordEncoder _writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:](self, "_writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:", v22 + v23, objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
    v25 = v10 + a4;

  }
  else
  {
    v39 = a2;
    memset(__src, 0, 75);
    v11 = -[ECEncodedWordEncoder _writeEncodedWordPreambleToBuffer:length:](self, "_writeEncodedWordPreambleToBuffer:length:", __src, 75);
    v40 = &v38;
    v12 = 73 - v11;
    v13 = MEMORY[0x1E0C80A78]();
    v15 = (char *)&v38 - v14;
    if (v13 != 73)
      memset((char *)&v38 - v14, 170, v12);
    v48 = 0;
    v49 = 0;
    v46 = 0;
    v47 = 0;
    -[ECEncodedWordEncoder string](self, "string");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v16 = -[ECEncodedWordEncoder stringEncoding](self, "stringEncoding");
    v17 = objc_msgSend(v42, "length");
    *(_QWORD *)&v45 = 0;
    *((_QWORD *)&v45 + 1) = v17;
    v41 = v11 + 3;
    if (v9 >= v11 + 3)
    {
      v18 = v9 - v11 - 2;
      v44 = xmmword_1B9B337F0;
      v43 = 0;
      if (!-[ECEncodedWordEncoder _getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:](self, "_getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:", v15, v18, &v49, &v43, &v47, &v48, &v46, v42, v16, 0, v17, &v44)|| v43|| v47 > v18)
      {
        if (v18 >= v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("ECEncodedWord.m"), 830, CFSTR("Failed to get bytes from string"));

        }
        v48 = 0;
        v46 = 0;
      }
      else
      {
        v19 = objc_msgSend(v7, "length");
        objc_msgSend(v7, "increaseLengthBy:", v11 + v47 + 2);
        v20 = (char *)(objc_msgSend(objc_retainAutorelease(v7), "mutableBytes") + v19);
        memcpy(v20, __src, v11);
        -[ECEncodedWordEncoder _writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:](self, "_writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:", &v20[v11], v15, v49);
        v45 = v44;
        if (v48)
          memmove(v15, &v15[v49], v48);
      }
      v17 = *((_QWORD *)&v45 + 1);
    }
    if (v17)
    {
      do
      {
        LOBYTE(v44) = 0;
        if (!-[ECEncodedWordEncoder _getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:](self, "_getBytesWithoutSplittingComposedCharacters:targetQEncodedTextLength:usedLength:splitComposedCharacterSequence:usedQEncodedTextLength:extraLength:extraQEncodedTextLength:fromString:stringEncoding:range:remainingRange:", v15, v12, &v49, &v44, &v47, &v48, &v46, v42, v16, (_QWORD)v45, v17, &v45))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("ECEncodedWord.m"), 843, CFSTR("Failed to get bytes from string"));

        }
        if ((_BYTE)v44)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("ECEncodedWord.m"), 844, CFSTR("Can't make encoded-word without splitting a composed character sequence"));

        }
        if (v47 > v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("ECEncodedWord.m"), 845, CFSTR("Can't make encoded-word without splitting a composed character sequence"));

        }
        v26 = objc_msgSend(v7, "length");
        objc_msgSend(v7, "increaseLengthBy:", v11 + 4 + v47);
        v27 = v47;
        v28 = (_WORD *)(objc_msgSend(objc_retainAutorelease(v7), "mutableBytes") + v26);
        *v28++ = 8202;
        memcpy(v28, __src, v11);
        -[ECEncodedWordEncoder _writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:](self, "_writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:", (char *)v28 + v11, v15, v49);
        if (v48)
          memmove(v15, &v15[v49], v48);
        v17 = *((_QWORD *)&v45 + 1);
      }
      while (*((_QWORD *)&v45 + 1));
      v25 = v41 + v27;
    }
    else
    {
      v25 = 0;
    }
    if (v48)
    {
      if (v46 > v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("ECEncodedWord.m"), 868, CFSTR("Can't make encoded-word without splitting a composed character sequence"));

      }
      v32 = objc_msgSend(v7, "length");
      objc_msgSend(v7, "increaseLengthBy:", v11 + v46 + 4);
      v33 = v46;
      v34 = (_WORD *)(objc_msgSend(objc_retainAutorelease(v7), "mutableBytes") + v32);
      *v34++ = 8202;
      memcpy(v34, __src, v11);
      -[ECEncodedWordEncoder _writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:](self, "_writeQEncodedTextAndEndSequenceToHeaderBytes:fromDecodedBytes:length:", (char *)v34 + v11, v15, v48);
      v25 = v41 + v33;
    }

  }
  return v25;
}

- (BOOL)_getBytesWithoutSplittingComposedCharacters:(void *)a3 targetQEncodedTextLength:(unint64_t)a4 usedLength:(unint64_t *)a5 splitComposedCharacterSequence:(BOOL *)a6 usedQEncodedTextLength:(unint64_t *)a7 extraLength:(unint64_t *)a8 extraQEncodedTextLength:(unint64_t *)a9 fromString:(id)a10 stringEncoding:(unint64_t)a11 range:(_NSRange)a12 remainingRange:(_NSRange *)a13
{
  id v18;
  id v19;
  char v20;
  _QWORD v24[4];
  id v25;
  ECEncodedWordEncoder *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  BOOL *v33;
  unint64_t *v34;
  unint64_t *v35;
  _NSRange *v36;
  _NSRange v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;

  v18 = a10;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = *a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = *a9;
  *a8 = 0;
  *a9 = 0;
  a13->location = a12.location + a12.length;
  a13->length = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __241__ECEncodedWordEncoder__getBytesWithoutSplittingComposedCharacters_targetQEncodedTextLength_usedLength_splitComposedCharacterSequence_usedQEncodedTextLength_extraLength_extraQEncodedTextLength_fromString_stringEncoding_range_remainingRange___block_invoke;
  v24[3] = &unk_1E7121078;
  v31 = a4;
  v32 = a11;
  v27 = &v46;
  v28 = &v38;
  v25 = v18;
  v26 = self;
  v29 = &v42;
  v30 = a3;
  v33 = a6;
  v34 = a8;
  v35 = a9;
  v36 = a13;
  v37 = a12;
  v19 = v18;
  objc_msgSend(v19, "enumerateSubstringsInRange:options:usingBlock:", a12.location, a12.length, 514, v24);
  *a5 = v47[3];
  *a7 = v43[3];
  v20 = *((_BYTE *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v20;
}

uint64_t __241__ECEncodedWordEncoder__getBytesWithoutSplittingComposedCharacters_targetQEncodedTextLength_usedLength_splitComposedCharacterSequence_usedQEncodedTextLength_extraLength_extraQEncodedTextLength_fromString_stringEncoding_range_remainingRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(a1 + 72) + v11;
  v13 = *(_QWORD *)(a1 + 80) - v11;
  v22 = 0;
  v21 = xmmword_1B9B337F0;
  result = objc_msgSend(*(id *)(a1 + 32), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v12, v13, &v22, *(_QWORD *)(a1 + 88), 0, a3, a4, &v21);
  if (!(_DWORD)result
    || (v15 = *((_QWORD *)&v21 + 1)) != 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a7 = 1;
    v16 = *(uint64_t **)(a1 + 120);
    v17 = *(_QWORD *)(a1 + 128) - a3 + *(_QWORD *)(a1 + 136);
    *v16 = a3;
LABEL_5:
    v16[1] = v17;
    return result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  **(_BYTE **)(a1 + 96) = v15 != 0;
  result = objc_msgSend(*(id *)(a1 + 40), "_lengthOfQEncodedTextForBytes:length:", v12, v22);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + result;
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(_QWORD *)(v19 + 24);
  if (v18 > *(_QWORD *)(a1 + 80) && v20)
  {
    **(_QWORD **)(a1 + 104) = v22;
    **(_QWORD **)(a1 + 112) = result;
  }
  else
  {
    *(_QWORD *)(v19 + 24) = v20 + v22;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18;
  }
  if (v18 >= *(_QWORD *)(a1 + 80) || *((_QWORD *)&v21 + 1))
  {
    *a7 = 1;
    v16 = *(uint64_t **)(a1 + 120);
    v17 = *(_QWORD *)(a1 + 128) - (a3 + a4) + *(_QWORD *)(a1 + 136);
    *v16 = a3 + a4;
    goto LABEL_5;
  }
  return result;
}

- (unint64_t)_lengthOfQEncodedTextForBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  int v10;

  v4 = a4;
  v6 = &a3[a4];
  v7 = -[ECEncodedWordEncoder _findNextByteThatNeedsQEncodingBetweenStartByte:endByte:](self, "_findNextByteThatNeedsQEncodingBetweenStartByte:endByte:");
  if (v7)
  {
    v8 = v7;
    do
    {
      v10 = *(unsigned __int8 *)v8;
      v9 = v8 + 1;
      if (v10 != 32)
        v4 += 2;
      v8 = -[ECEncodedWordEncoder _findNextByteThatNeedsQEncodingBetweenStartByte:endByte:](self, "_findNextByteThatNeedsQEncodingBetweenStartByte:endByte:", v9, v6);
    }
    while (v8);
  }
  return v4;
}

- (void)_writeQEncodedTextAndEndSequenceToHeaderBytes:(char *)a3 fromDecodedBytes:(const char *)a4 length:(unint64_t)a5
{
  const char *v5;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  size_t v12;

  v5 = a4;
  v8 = &a4[a5];
  v9 = -[ECEncodedWordEncoder _findNextByteThatNeedsQEncodingBetweenStartByte:endByte:](self, "_findNextByteThatNeedsQEncodingBetweenStartByte:endByte:", a4, &a4[a5]);
  if (v9)
  {
    v10 = v9;
    do
    {
      if (v5 < v10)
      {
        memcpy(a3, v5, v10 - v5);
        a3 += v10 - v5;
      }
      if (*v10 == 32)
      {
        *a3 = 95;
        v11 = 1;
      }
      else
      {
        *a3 = 61;
        a3[1] = byte_1B9B33800[(unint64_t)*(unsigned __int8 *)v10 >> 4];
        a3[2] = byte_1B9B33800[*v10 & 0xF];
        v11 = 3;
      }
      a3 += v11;
      v5 = v10 + 1;
      v10 = -[ECEncodedWordEncoder _findNextByteThatNeedsQEncodingBetweenStartByte:endByte:](self, "_findNextByteThatNeedsQEncodingBetweenStartByte:endByte:", v10 + 1, v8);
    }
    while (v10);
  }
  if (v5 < v8)
  {
    v12 = v8 - v5;
    memcpy(a3, v5, v12);
    a3 += v12;
  }
  *(_WORD *)a3 = 15679;
}

- (const)_findNextByteThatNeedsQEncodingBetweenStartByte:(const char *)a3 endByte:(const char *)a4
{
  int64_t v6;

  if (_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__onceToken != -1)
    dispatch_once(&_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__onceToken, &__block_literal_global_89);
  if (a3 >= a4)
    return 0;
  v6 = a4 - a3;
  while (((*((unsigned __int8 *)&_findNextByteThatNeedsQEncodingBetweenStartByte_endByte__bytesThatNeedEncoding
            + ((unint64_t)*(unsigned __int8 *)a3 >> 3)) >> (*a3 & 7)) & 1) == 0)
  {
    ++a3;
    if (!--v6)
      return 0;
  }
  return a3;
}

void __80__ECEncodedWordEncoder__findNextByteThatNeedsQEncodingBetweenStartByte_endByte___block_invoke()
{
  _findNextByteThatNeedsQEncodingBetweenStartByte_endByte__bytesThatNeedEncoding = -1;
  byte_1EF23DA94 |= 0xFDu;
  byte_1EF23DA95 |= 0x53u;
  byte_1EF23DA97 |= 0xFCu;
  byte_1EF23DA98 |= 1u;
  byte_1EF23DA9B |= 0xF8u;
  byte_1EF23DA9C |= 1u;
  byte_1EF23DA9F |= 0xF8u;
  qword_1EF23DAA0 = -1;
  unk_1EF23DAA8 = -1;
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)characterSet
{
  return self->_characterSet;
}

- (void)setCharacterSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)encodedWordEncoding
{
  return self->_encodedWordEncoding;
}

- (void)setEncodedWordEncoding:(int64_t)a3
{
  self->_encodedWordEncoding = a3;
}

- (NSData)decodedText
{
  return self->_decodedText;
}

- (void)setDecodedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)singleEncodedWordLength
{
  return self->_singleEncodedWordLength;
}

- (void)setSingleEncodedWordLength:(unint64_t)a3
{
  self->_singleEncodedWordLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedText, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
