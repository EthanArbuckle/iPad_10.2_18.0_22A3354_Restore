@implementation BLItemArtworkImage

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_imageKind, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (int64_t)height
{
  void *v3;
  int64_t v4;
  double v5;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("box-height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = 0;
  -[BLItemArtworkImage imageScale](self, "imageScale");
  if (v5 > 0.00000011920929)
    v4 = (uint64_t)((double)v4 / v5);

  return v4;
}

- (double)imageScale
{
  void *v2;
  double v3;
  float v4;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("scale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v3 = v4;
  }

  return v3;
}

- (int64_t)width
{
  void *v3;
  int64_t v4;
  double v5;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("box-width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = 0;
  -[BLItemArtworkImage imageScale](self, "imageScale");
  if (v5 > 0.00000011920929)
    v4 = (uint64_t)((double)v4 / v5);

  return v4;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)BLItemArtworkImage;
  -[BLItemArtworkImage description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLItemArtworkImage imageKind](self, "imageKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BLItemArtworkImage width](self, "width");
  v7 = -[BLItemArtworkImage height](self, "height");
  -[BLItemArtworkImage URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@ %ldx%ld] %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForProperty:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BLItemArtworkImage)initWithArtworkDictionary:(id)a3
{
  id v4;
  BLItemArtworkImage *v5;
  uint64_t v6;
  NSMutableDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLItemArtworkImage;
  v5 = -[BLItemArtworkImage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (CGSize)imageSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[BLItemArtworkImage width](self, "width");
  v4 = (double)-[BLItemArtworkImage height](self, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4
{
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "hasSuffix:", CFSTR("@2x")))
  {
    LODWORD(v7) = 2.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLItemArtworkImage _setValue:forKey:](self, "_setValue:forKey:", v8, CFSTR("scale"));

    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 3);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(".%@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLItemArtworkImage setImageKind:](self, "setImageKind:", v10);

}

- (void)setURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLItemArtworkImage _setValue:forKey:](self, "_setValue:forKey:", v4, CFSTR("url"));

}

- (NSString)URLString
{
  return (NSString *)-[BLItemArtworkImage valueForProperty:](self, "valueForProperty:", CFSTR("url"));
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *dictionary;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  dictionary = self->_dictionary;
  if (v12)
  {
    if (!dictionary)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v11 = self->_dictionary;
      self->_dictionary = v10;

      v7 = v12;
      dictionary = self->_dictionary;
    }
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", v8);
  }

}

- (NSString)imageKind
{
  return self->_imageKind;
}

- (void)setImageKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageKind, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
