@implementation EmojiGenerationHostToClientAction

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4;
  _TtC10StickerKit33EmojiGenerationHostToClientAction *v5;

  v4 = a3;
  v5 = self;
  sub_2346439B0(v4);

}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2345F2D0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for EmojiGenerationHostToClientAction);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v9 = _Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_2345F3434;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  v12 = a5;
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2345F2D74((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_14, (uint64_t (*)(uint64_t))type metadata accessor for EmojiGenerationHostToClientAction, a4);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)init
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2345F2F24(self, (uint64_t)a2, type metadata accessor for EmojiGenerationHostToClientAction);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2345F2F88(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationHostToClientAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2345F2F88(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationHostToClientAction, (SEL *)&selRef_initWithCoder_);
}

@end
