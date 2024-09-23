@implementation CCUIAccessoryButton

- (BOOL)isEnabled
{
  return sub_1CFBC0CB8(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  CCUIAccessoryButton *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for AccessoryButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[CCUIAccessoryButton isEnabled](&v9, sel_isEnabled);
  v8.receiver = v6;
  v8.super_class = v5;
  -[CCUIAccessoryButton setEnabled:](&v8, sel_setEnabled_, v3);
  sub_1CFBC0554(v7);

}

- (BOOL)isHighlighted
{
  return sub_1CFBC0CB8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  CCUIAccessoryButton *v4;

  v4 = self;
  sub_1CFBC0D34(a3);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CCUIAccessoryButton *v7;
  void *v8;
  CCUIAccessoryButton *v9;
  unsigned int v10;
  char v11;
  objc_super v13;

  if (a3)
  {
    v4 = sub_1CFBFA894();
    v6 = v5;
    v7 = self;
    v8 = (void *)sub_1CFBFA870();
  }
  else
  {
    v9 = self;
    v8 = 0;
    v4 = 0;
    v6 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AccessoryButton();
  v10 = -[CCUIAccessoryButton _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v8);

  if (v10)
    goto LABEL_9;
  if (qword_1ED90B000 != -1)
  {
    swift_once();
    if (v6)
      goto LABEL_7;
LABEL_12:

    v11 = 0;
    return v11 & 1;
  }
  if (!v6)
    goto LABEL_12;
LABEL_7:
  if (v4 != qword_1ED90AFE8 || v6 != *(_QWORD *)algn_1ED90AFF0)
  {
    v11 = sub_1CFBFAD8C();

    swift_bridgeObjectRelease();
    return v11 & 1;
  }
LABEL_9:

  swift_bridgeObjectRelease();
  v11 = 1;
  return v11 & 1;
}

- (CCUIAccessoryButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AccessoryButton();
  return -[CCUIAccessoryButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (CCUIAccessoryButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccessoryButton();
  return -[CCUIAccessoryButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
