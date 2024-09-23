@implementation HAPArrayWrapper

- (NSArray)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (id)objectCreator
{
  return self->_objectCreator;
}

- (void)setObjectCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectCreator, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4 objectCreator:(id)a5
{
  id v7;
  id v8;
  HAPArrayWrapper *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HAPFieldWrapper initWithTlvId:name:]([HAPArrayWrapper alloc], "initWithTlvId:name:", a3, v8);

  -[HAPArrayWrapper setObjectCreator:](v9, "setObjectCreator:", v7);
  return v9;
}

@end
