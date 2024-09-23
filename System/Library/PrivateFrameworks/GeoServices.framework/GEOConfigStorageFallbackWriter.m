@implementation GEOConfigStorageFallbackWriter

- (GEOConfigStorageFallbackWriter)initWithStorage:(id)a3 writer:(id)a4
{
  id v7;
  GEOConfigStorageFallbackWriter *v8;
  GEOConfigStorageFallbackWriter *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOConfigStorageFallbackWriter;
  v8 = -[GEOConfigStorageFallbackReader initWithStorage:](&v11, sel_initWithStorage_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_writer, a4);

  return v9;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  -[GEOConfigStorageReadWrite setConfigValue:forKey:options:synchronous:](self->_writer, "setConfigValue:forKey:options:synchronous:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

@end
