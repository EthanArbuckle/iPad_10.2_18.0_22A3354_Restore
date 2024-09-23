@implementation DYExtension

- (DYExtension)init
{
  -[DYExtension doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_initWithDictionary:(id)a3 bundle:(id)a4
{
  DYExtension *v6;
  NSString *v7;
  NSString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DYExtension;
  v6 = -[DYExtension init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("slot"));
    v6->_slot = v7;
    if (v7
      && (v8 = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("identifier")),
          (v6->_identifier = v8) != 0))
    {
      v6->_dictionary = (NSDictionary *)a3;
      v6->_bundle = (NSBundle *)a4;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExtension;
  -[DYExtension dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExtension;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: slot=%@ identifier=%@ bundle=%@"), -[DYExtension description](&v3, sel_description), self->_slot, self->_identifier, self->_bundle);
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (NSString)slot
{
  return self->_slot;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

@end
