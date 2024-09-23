@implementation _EARWordPart

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tag:(int64_t)a5
{
  id v8;
  id v9;
  _EARWordPart *v10;
  uint64_t v11;
  NSString *orthography;
  uint64_t v13;
  NSSet *pronunciations;
  NSString *tagName;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_EARWordPart;
  v10 = -[_EARWordPart init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    orthography = v10->_orthography;
    v10->_orthography = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    pronunciations = v10->_pronunciations;
    v10->_pronunciations = (NSSet *)v13;

    tagName = v10->_tagName;
    v10->_tagName = 0;

    v10->_tag = a5;
    v10->_frequency = 1;
  }

  return v10;
}

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6
{
  return -[_EARWordPart initWithOrthography:pronunciations:tagName:frequency:phoneticOrthography:](self, "initWithOrthography:pronunciations:tagName:frequency:phoneticOrthography:", a3, a4, a5, a6, 0);
}

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6 phoneticOrthography:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _EARWordPart *v16;
  uint64_t v17;
  NSString *orthography;
  uint64_t v19;
  NSSet *pronunciations;
  uint64_t v21;
  NSString *tagName;
  uint64_t v23;
  NSString *phoneticOrthography;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_EARWordPart;
  v16 = -[_EARWordPart init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    orthography = v16->_orthography;
    v16->_orthography = (NSString *)v17;

    if (v13)
    {
      v19 = objc_msgSend(v13, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    pronunciations = v16->_pronunciations;
    v16->_pronunciations = (NSSet *)v19;

    v16->_tag = 0;
    v21 = objc_msgSend(v14, "copy");
    tagName = v16->_tagName;
    v16->_tagName = (NSString *)v21;

    v16->_frequency = a6;
    v23 = objc_msgSend(v15, "copy");
    phoneticOrthography = v16->_phoneticOrthography;
    v16->_phoneticOrthography = (NSString *)v23;

  }
  return v16;
}

- (NSString)tagName
{
  NSString *tagName;
  unint64_t v4;
  const char *v5;

  tagName = self->_tagName;
  if (tagName)
    return tagName;
  v4 = self->_tag - 1;
  if (v4 > 6)
    v5 = "";
  else
    v5 = off_1E5D46E40[v4];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)orthography
{
  return self->_orthography;
}

- (int64_t)tag
{
  return self->_tag;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (NSSet)pronunciations
{
  return self->_pronunciations;
}

- (NSString)phoneticOrthography
{
  return self->_phoneticOrthography;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticOrthography, 0);
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
}

@end
