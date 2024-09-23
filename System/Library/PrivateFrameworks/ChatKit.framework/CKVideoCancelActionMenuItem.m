@implementation CKVideoCancelActionMenuItem

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  _BOOL8 v4;
  CKVideoCancelActionMenuItem *v5;
  _BOOL8 v6;
  uint64_t v7;

  v4 = a4;
  v5 = self;
  switch(a3)
  {
    case 1:
      -[CKVideoCancelActionMenuItem setTouchDownCount:](self, "setTouchDownCount:", -[CKVideoCancelActionMenuItem touchDownCount](self, "touchDownCount") + 1);
      goto LABEL_3;
    case 2:
LABEL_3:
      self = v5;
      v6 = v4;
      v7 = 1;
      goto LABEL_9;
    case 3:
      -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
      if (v4 && -[CKVideoCancelActionMenuItem touchDownCount](v5, "touchDownCount") >= 2)
        -[CKActionMenuItem sendAction](v5, "sendAction");
      return;
    case 4:
      v6 = 0;
      v7 = 0;
LABEL_9:
      -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", v6, v7);
      break;
    default:
      return;
  }
}

- (unint64_t)touchDownCount
{
  return self->_touchDownCount;
}

- (void)setTouchDownCount:(unint64_t)a3
{
  self->_touchDownCount = a3;
}

@end
