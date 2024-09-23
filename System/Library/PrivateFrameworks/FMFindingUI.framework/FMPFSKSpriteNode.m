@implementation FMPFSKSpriteNode

- (_TtC11FMFindingUI16FMPFSKSpriteNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  char *v9;
  char *v10;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  v9 = (char *)self + OBJC_IVAR____TtC11FMFindingUI16FMPFSKSpriteNode_brightness;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)self + OBJC_IVAR____TtC11FMFindingUI16FMPFSKSpriteNode_previousBrightness;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FMPFSKSpriteNode();
  return -[SKSpriteNode initWithTexture:color:size:](&v12, sel_initWithTexture_color_size_, a3, a4, width, height);
}

- (_TtC11FMFindingUI16FMPFSKSpriteNode)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  objc_super v7;

  v4 = (char *)self + OBJC_IVAR____TtC11FMFindingUI16FMPFSKSpriteNode_brightness;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC11FMFindingUI16FMPFSKSpriteNode_previousBrightness;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMPFSKSpriteNode();
  return -[SKSpriteNode initWithCoder:](&v7, sel_initWithCoder_, a3);
}

@end
