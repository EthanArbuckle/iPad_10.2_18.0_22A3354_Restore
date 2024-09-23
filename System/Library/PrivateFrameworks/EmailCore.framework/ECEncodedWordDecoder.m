@implementation ECEncodedWordDecoder

- (ECEncodedWordDecoder)initWithHeaderData:(id)a3
{
  id v4;
  ECEncodedWordDecoder *v5;
  uint64_t v6;
  NSData *headerData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECEncodedWordDecoder;
  v5 = -[ECEncodedWordDecoder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    headerData = v5->_headerData;
    v5->_headerData = (NSData *)v6;

    *(_OWORD *)&v5->_encodedWordEncoding = xmmword_1B9B337E0;
    v5->_encodedTextRange.length = 0;
  }

  return v5;
}

- (ECEncodedWordDecoder)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 101, CFSTR("Invalid initializer called, returning nil"));

  return 0;
}

- (_NSRange)identifyRangeOfEncodedWordAtIndex:(unint64_t)a3
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  NSUInteger v49;
  NSUInteger v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unsigned __int8 v56;
  _NSRange result;

  -[ECEncodedWordDecoder headerData](self, "headerData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v6;
  v7 = objc_msgSend(v6, "length");
  v8 = v7 - a3;
  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEncodedWord.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < headerLength"));

  }
  -[ECEncodedWordDecoder _encodedWordStartSequence](self, "_encodedWordStartSequence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "rangeOfData:options:range:", v9, 2, a3, v8);
  v12 = v11;

  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
    v54 = 0;
    v15 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[ECEncodedWordDecoder _lineSeparator](self, "_lineSeparator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12 + a3;
    v20 = v8 - v12;
    v21 = objc_msgSend(v55, "rangeOfData:options:range:", v18, 0, v12 + a3, v20);

    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      v20 = v21 - v19;
    -[ECEncodedWordDecoder _encodedWordDelimiter](self, "_encodedWordDelimiter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v55, "rangeOfData:options:range:", v22, 0, v12 + a3, v20);
    v16 = v23;
    v14 = v24;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {

      v54 = 0;
      v15 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = v55;
      goto LABEL_13;
    }
    v25 = v20 + v19;
    v26 = v20 + v19 - (v23 + v24);
    v6 = v55;
    v27 = objc_msgSend(v55, "rangeOfData:options:range:", v22, 0, v23 + v24, v26);
    v54 = v28;
    v29 = v27;

    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ECEncodedWordDecoder _encodedWordEndSequence](self, "_encodedWordEndSequence");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v55, "rangeOfData:options:range:", v52, 0, v29 + v54, v25 - (v29 + v54));
      v15 = v30;

      v13 = v29;
      goto LABEL_13;
    }
    v15 = 0;
  }
  v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  v31 = 0;
  v53 = v13;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v13 - v16 == 2)
  {
    v56 = 0;
    objc_msgSend(v6, "getBytes:range:", &v56, v16 + v14, 1);
    v31 = 0;
    if (v56 > 0x61u)
    {
      if (v56 != 98)
      {
        if (v56 != 113)
          goto LABEL_23;
        goto LABEL_21;
      }
    }
    else if (v56 != 66)
    {
      if (v56 != 81)
        goto LABEL_23;
LABEL_21:
      v31 = 2;
      goto LABEL_23;
    }
    v31 = 1;
  }
LABEL_23:
  -[ECEncodedWordDecoder setEncodedWordEncoding:](self, "setEncodedWordEncoding:", v31);
  if (v31)
  {
    -[ECEncodedWordDecoder _encodedWordLanguageDelimiter](self, "_encodedWordLanguageDelimiter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v10 + v12;
    v34 = v16 - (v10 + v12);
    v35 = objc_msgSend(v6, "rangeOfData:options:range:", v32, 0, v33, v34);
    v37 = v36;
    v38 = v15 - a3 + v17;

    v39 = v16 - (v35 + v37);
    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      v40 = v34;
    else
      v40 = v35 - v33;
    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      v41 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v41 = v35 + v37;
    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      v42 = 0;
    else
      v42 = v39;
    if (v40)
    {
      objc_msgSend(v55, "subdataWithRange:", v33);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v43, 1);
      v45 = (__CFString *)v44;
      if (v44)
      {
        ECConvertCharacterSetNameToEncoding(v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = 0;
      }

    }
    else
    {
      v46 = 0;
    }
    -[ECEncodedWordDecoder setStringEncoding:](self, "setStringEncoding:", v46);
    if (v42)
    {
      objc_msgSend(v55, "subdataWithRange:", v41, v42);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v47, 1);

    }
    else
    {
      v48 = 0;
    }
    v6 = v55;
    -[ECEncodedWordDecoder setLanguage:](self, "setLanguage:", v48);
    -[ECEncodedWordDecoder setEncodedTextRange:](self, "setEncodedTextRange:", v53 + v54, v17 - (v53 + v54));

  }
  else
  {
    -[ECEncodedWordDecoder setStringEncoding:](self, "setStringEncoding:", 0);
    -[ECEncodedWordDecoder setLanguage:](self, "setLanguage:", 0);
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    -[ECEncodedWordDecoder setEncodedTextRange:](self, "setEncodedTextRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    v38 = 0;
  }

  v49 = a3;
  v50 = v38;
  result.length = v50;
  result.location = v49;
  return result;
}

- (id)_encodedWordStartSequence
{
  if (_encodedWordStartSequence_onceToken != -1)
    dispatch_once(&_encodedWordStartSequence_onceToken, &__block_literal_global_7);
  return (id)_encodedWordStartSequence_encodedWordStartSequence;
}

void __49__ECEncodedWordDecoder__encodedWordStartSequence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kEncodedWordStartSequence, 2);
  v1 = (void *)_encodedWordStartSequence_encodedWordStartSequence;
  _encodedWordStartSequence_encodedWordStartSequence = v0;

}

- (id)_lineSeparator
{
  if (_lineSeparator_onceToken != -1)
    dispatch_once(&_lineSeparator_onceToken, &__block_literal_global_10);
  return (id)_lineSeparator_lineSeparator;
}

void __38__ECEncodedWordDecoder__lineSeparator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kLineSeparator, 1);
  v1 = (void *)_lineSeparator_lineSeparator;
  _lineSeparator_lineSeparator = v0;

}

- (id)_encodedWordEndSequence
{
  if (_encodedWordEndSequence_onceToken != -1)
    dispatch_once(&_encodedWordEndSequence_onceToken, &__block_literal_global_11);
  return (id)_encodedWordEndSequence_encodedWordEndSequence;
}

void __47__ECEncodedWordDecoder__encodedWordEndSequence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kEncodedWordEndSequence, 2);
  v1 = (void *)_encodedWordEndSequence_encodedWordEndSequence;
  _encodedWordEndSequence_encodedWordEndSequence = v0;

}

- (id)_encodedWordDelimiter
{
  if (_encodedWordDelimiter_onceToken != -1)
    dispatch_once(&_encodedWordDelimiter_onceToken, &__block_literal_global_12);
  return (id)_encodedWordDelimiter_encodedWordDelimiter;
}

void __45__ECEncodedWordDecoder__encodedWordDelimiter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kEncodedWordDelimiter, 1);
  v1 = (void *)_encodedWordDelimiter_encodedWordDelimiter;
  _encodedWordDelimiter_encodedWordDelimiter = v0;

}

- (id)_encodedWordLanguageDelimiter
{
  if (_encodedWordLanguageDelimiter_onceToken != -1)
    dispatch_once(&_encodedWordLanguageDelimiter_onceToken, &__block_literal_global_13);
  return (id)_encodedWordLanguageDelimiter_encodedWordLanguageDelimiter;
}

void __53__ECEncodedWordDecoder__encodedWordLanguageDelimiter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &kEncodedWordLanguageDelimiter, 1);
  v1 = (void *)_encodedWordLanguageDelimiter_encodedWordLanguageDelimiter;
  _encodedWordLanguageDelimiter_encodedWordLanguageDelimiter = v0;

}

- (BOOL)decodeEncodedTextToData:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = -[ECEncodedWordDecoder encodedWordEncoding](self, "encodedWordEncoding");
  if (v5 == 1)
  {
    -[ECEncodedWordDecoder encodedTextRange](self, "encodedTextRange");
    if (v8)
    {
      v7 = -[ECEncodedWordDecoder _decodeBEncodedTextToData:](self, "_decodeBEncodedTextToData:", v4);
      goto LABEL_7;
    }
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  if (v5 != 2)
  {
    v9 = 0;
    goto LABEL_10;
  }
  -[ECEncodedWordDecoder encodedTextRange](self, "encodedTextRange");
  if (!v6)
    goto LABEL_9;
  v7 = -[ECEncodedWordDecoder _decodeQEncodedTextToData:](self, "_decodeQEncodedTextToData:", v4);
LABEL_7:
  v9 = v7;
LABEL_10:

  return v9;
}

- (BOOL)_decodeBEncodedTextToData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ECEncodedWordDecoder headerData](self, "headerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ECEncodedWordDecoder encodedTextRange](self, "encodedTextRange");
  objc_msgSend(v5, "subdataWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v8, 1);
  if (v9)
    objc_msgSend(v4, "appendData:", v9);

  return v9 != 0;
}

- (BOOL)_decodeQEncodedTextToData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[3];
  unint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  -[ECEncodedWordDecoder encodedTextRange](self, "encodedTextRange");
  v5 = MEMORY[0x1E0C809B0];
  v17 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke;
  v13[3] = &unk_1E7121050;
  v13[4] = &v14;
  -[ECEncodedWordDecoder _enumerateQByteRangesUsingBlock:](self, "_enumerateQByteRangesUsingBlock:", v13);
  v7 = objc_msgSend(v4, "length");
  objc_msgSend(v4, "increaseLengthBy:", v15[3]);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v8 = objc_retainAutorelease(v4);
  v12 = objc_msgSend(v8, "mutableBytes") + v7;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke_2;
  v10[3] = &unk_1E7121050;
  v10[4] = v11;
  -[ECEncodedWordDecoder _enumerateQByteRangesUsingBlock:](self, "_enumerateQByteRangesUsingBlock:", v10);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v14, 8);

  return 1;
}

uint64_t __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) -= 2;
  return result;
}

uint64_t __50__ECEncodedWordDecoder__decodeQEncodedTextToData___block_invoke_2(uint64_t result, unsigned __int8 *__src, size_t a3, uint64_t a4)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = result;
  if (a4 == 2)
  {
    v9 = a3;
    v7 = result + 32;
    result = (uint64_t)memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24), __src, a3);
  }
  else
  {
    if (a4 == 1)
    {
      v7 = result + 32;
      **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 32;
    }
    else
    {
      if (a4)
        return result;
      v6 = __maskrune(__src[1], 0xFuLL);
      result = __maskrune(__src[2], 0xFuLL);
      v8 = *(_QWORD *)(v5 + 32);
      v7 = v5 + 32;
      **(_BYTE **)(*(_QWORD *)(v8 + 8) + 24) = result + 16 * v6;
    }
    v9 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) += v9;
  return result;
}

- (void)_enumerateQByteRangesUsingBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v22 = a3;
  v4 = -[ECEncodedWordDecoder encodedTextRange](self, "encodedTextRange");
  v6 = v5;
  -[ECEncodedWordDecoder headerData](self, "headerData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "bytes");

  if (v6 <= 0)
  {
    v21 = v22;
    goto LABEL_26;
  }
  v9 = 0;
  v10 = (unsigned __int8 *)(v8 + v4);
  v11 = (unint64_t)&v10[v6];
  v12 = MEMORY[0x1E0C80978];
  v13 = v22;
  do
  {
    v14 = *v10;
    if (v14 == 95)
    {
      v16 = v13;
      v17 = v16;
      if (v9)
        (*((void (**)(id, unsigned __int8 *, int64_t, uint64_t))v22 + 2))(v16, v9, v10 - v9, 2);
      (*((void (**)(void *, unsigned __int8 *, uint64_t, uint64_t))v22 + 2))(v17, v10, 1, 1);

      v9 = 0;
      v15 = 1;
      goto LABEL_14;
    }
    if (v14 != 61)
      goto LABEL_8;
    if ((unint64_t)(v10 + 2) < v11)
    {
      if ((*(_DWORD *)(v12 + 4 * v10[1] + 60) & 0x10000) != 0
        && (*(_DWORD *)(v12 + 4 * v10[2] + 60) & 0x10000) != 0)
      {
        v18 = v13;
        v19 = v18;
        if (v9)
          (*((void (**)(id, unsigned __int8 *, int64_t, uint64_t))v22 + 2))(v18, v9, v10 - v9, 2);
        (*((void (**)(void *, unsigned __int8 *, uint64_t, _QWORD))v22 + 2))(v19, v10, 3, 0);

        v9 = 0;
        v15 = 3;
LABEL_14:
        v13 = v22;
        goto LABEL_18;
      }
LABEL_8:
      if (!v9)
        v9 = v10;
      v15 = 1;
      goto LABEL_18;
    }
    if (!v9)
      v9 = v10;
    v15 = v11 - (_QWORD)v10;
LABEL_18:
    v10 += v15;
  }
  while ((unint64_t)v10 < v11);
  v20 = v13;
  if (v9)
    (*((void (**)(id, unsigned __int8 *, unint64_t, uint64_t))v22 + 2))(v20, v9, v11 - (_QWORD)v9, 2);
LABEL_26:

}

- (NSNumber)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(id)a3
{
  objc_storeStrong((id *)&self->_stringEncoding, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)headerData
{
  return self->_headerData;
}

- (int64_t)encodedWordEncoding
{
  return self->_encodedWordEncoding;
}

- (void)setEncodedWordEncoding:(int64_t)a3
{
  self->_encodedWordEncoding = a3;
}

- (_NSRange)encodedTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_encodedTextRange.length;
  location = self->_encodedTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEncodedTextRange:(_NSRange)a3
{
  self->_encodedTextRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerData, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_stringEncoding, 0);
}

@end
