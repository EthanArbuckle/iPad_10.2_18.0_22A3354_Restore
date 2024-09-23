@implementation IAStringDetails

+ (id)sharedPunctuationCharacterSet
{
  if (qword_254343B78 != -1)
    dispatch_once(&qword_254343B78, &unk_250F8F278);
  return (id)qword_254343B80;
}

+ (unint64_t)emojiCountForText:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (objc_msgSend_length(v3, v4, v5, v6, v7) && objc_msgSend__containsEmoji(v3, v8, v9, v10, v11))
  {
    v16 = objc_msgSend_length(v3, v12, v13, v14, v15);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_23F096718;
    v20[3] = &unk_250F8F9B0;
    v20[4] = &v21;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v3, v17, 0, v16, (uint64_t)v20);
  }
  v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

+ (unint64_t)normalizedTextLength:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (objc_msgSend_length(v3, v4, v5, v6, v7) && objc_msgSend__containsEmoji(v3, v8, v9, v10, v11))
  {
    v12 = objc_msgSend_length(v3, v8, v9, v10, v11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_23F09685C;
    v21[3] = &unk_250F8F9D8;
    v21[4] = &v26;
    v21[5] = &v22;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v3, v13, 0, v12, (uint64_t)v21);
    v18 = objc_msgSend_length(v3, v14, v15, v16, v17);
    v19 = v18 - v23[3] + v27[3];
  }
  else
  {
    v19 = objc_msgSend_length(v3, v8, v9, v10, v11);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v19;
}

+ (unint64_t)punctuationCountForText:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    v12 = objc_msgSend_length(v3, v8, v9, v10, v11);
    objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v13, (uint64_t)v3, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_class();
    v22 = objc_msgSend_sharedPunctuationCharacterSet(v17, v18, v19, v20, v21);
    objc_msgSend__removeCharactersFromSet_(v16, v23, v22, v24, v25);
    v30 = v12 - objc_msgSend_length(v16, v26, v27, v28, v29);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)getDetailsForString:(id)a3
{
  id v3;
  IAStringDetails *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  v4 = objc_alloc_init(IAStringDetails);
  v8 = objc_msgSend_normalizedTextLength_(IAStringDetails, v5, (uint64_t)v3, v6, v7);
  objc_msgSend_setCharacters_(v4, v9, v8, v10, v11);
  v15 = objc_msgSend_emojiCountForText_(IAStringDetails, v12, (uint64_t)v3, v13, v14);
  objc_msgSend_setEmojiCharacters_(v4, v16, v15, v17, v18);
  v22 = objc_msgSend_punctuationCountForText_(IAStringDetails, v19, (uint64_t)v3, v20, v21);

  objc_msgSend_setPunctuationCharacters_(v4, v23, v22, v24, v25);
  return v4;
}

- (unint64_t)characters
{
  return self->_characters;
}

- (void)setCharacters:(unint64_t)a3
{
  self->_characters = a3;
}

- (unint64_t)emojiCharacters
{
  return self->_emojiCharacters;
}

- (void)setEmojiCharacters:(unint64_t)a3
{
  self->_emojiCharacters = a3;
}

- (unint64_t)punctuationCharacters
{
  return self->_punctuationCharacters;
}

- (void)setPunctuationCharacters:(unint64_t)a3
{
  self->_punctuationCharacters = a3;
}

@end
