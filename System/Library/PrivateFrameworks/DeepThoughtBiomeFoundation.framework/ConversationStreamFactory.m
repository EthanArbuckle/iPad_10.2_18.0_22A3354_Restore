@implementation ConversationStreamFactory

+ (id)createWithType:(int64_t)a3
{
  objc_class *v3;

  if (a3)
    v3 = (objc_class *)type metadata accessor for ConversationStreamAIMLIS();
  else
    v3 = (objc_class *)type metadata accessor for ConversationStreamPLL();
  return objc_msgSend(objc_allocWithZone(v3), sel_init);
}

- (_TtC26DeepThoughtBiomeFoundation25ConversationStreamFactory)init
{
  return (_TtC26DeepThoughtBiomeFoundation25ConversationStreamFactory *)sub_23A2C278C(self, (uint64_t)a2, type metadata accessor for ConversationStreamFactory);
}

@end
