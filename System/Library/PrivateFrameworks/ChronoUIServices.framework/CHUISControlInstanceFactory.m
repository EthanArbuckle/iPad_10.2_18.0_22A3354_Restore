@implementation CHUISControlInstanceFactory

+ (id)instanceOfType:(unint64_t)a3 instanceIdentity:(id)a4
{
  id result;

  if (a3 - 1 <= 2)
    return objc_msgSend(objc_allocWithZone((Class)*off_1E6B86450[a3 - 1]), sel_initWithInstanceIdentity_, a4);
  result = (id)sub_1B7196A64();
  __break(1u);
  return result;
}

+ (id)instanceWithControl:(id)a3 type:(unint64_t)a4 content:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v10 = a3;
  v11 = objc_msgSend(v9, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v10, a5, 0, 0);
  v12 = objc_msgSend(a1, sel_instanceOfType_instanceIdentity_, a4, v11);

  return v12;
}

+ (id)instanceWithIdentity:(id)a3 type:(unint64_t)a4
{
  id v6;
  _BYTE *v7;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = sub_1B7173C58((uint64_t)v6, a4);

  return v7;
}

- (CHUISControlInstanceFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHUISControlInstanceFactory;
  return -[CHUISControlInstanceFactory init](&v3, sel_init);
}

@end
