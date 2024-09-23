@implementation USKHelper

+ (id)scene:(id)a3 nodeAtPath:(id)a4 type:(id)a5
{
  return (id)objc_msgSend(a3, "newNodeAtPath:type:", a4, a5);
}

+ (id)node:(id)a3 propertyWithName:(id)a4 type:(id)a5 role:(id)a6
{
  return (id)objc_msgSend(a3, "newPropertyWithName:type:role:", a4, a5, a6);
}

@end
