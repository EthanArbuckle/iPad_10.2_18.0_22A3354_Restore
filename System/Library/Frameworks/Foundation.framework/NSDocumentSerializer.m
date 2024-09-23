@implementation NSDocumentSerializer

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqual:", CFSTR(".")))
    return -[NSAKSerializer serializeObject:](self, "serializeObject:", objc_msgSend(a5, "serializeToData"));
  v10.receiver = self;
  v10.super_class = (Class)NSDocumentSerializer;
  return -[NSAKSerializer serializePListValueIn:key:value:](&v10, sel_serializePListValueIn_key_value_, a3, a4, a5);
}

@end
