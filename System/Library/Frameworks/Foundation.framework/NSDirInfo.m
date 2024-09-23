@implementation NSDirInfo

- (NSDirInfo)init
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
  return self;
}

- (NSDirInfo)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:count:", a3, a4, a5);
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", a3, a4);
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
  return self;
}

- (NSDirInfo)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", a3);
  return self;
}

- (NSDirInfo)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSDirInfo;
  -[NSDirInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->dict, "count");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->dict, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->dict, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->dict, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->dict, "removeObjectForKey:", a3);
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return 0;
}

- (id)serializeToData
{
  uint64_t v3;
  NSAKSerializerStream *v4;
  id v5;
  id v6;

  v3 = -[NSDirInfo zone](self, "zone");
  v4 = -[NSAKSerializerStream init](+[NSAKSerializerStream allocWithZone:](NSAKSerializerStream, "allocWithZone:", v3), "init");
  v5 = -[NSAKSerializer initForSerializerStream:](+[NSDirInfoSerializer allocWithZone:](NSDirInfoSerializer, "allocWithZone:", v3), "initForSerializerStream:", v4);
  v6 = -[NSPageData initFromSerializerStream:length:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", v3), "initFromSerializerStream:length:", v4, objc_msgSend(v5, "serializePropertyList:", self));

  return v6;
}

@end
