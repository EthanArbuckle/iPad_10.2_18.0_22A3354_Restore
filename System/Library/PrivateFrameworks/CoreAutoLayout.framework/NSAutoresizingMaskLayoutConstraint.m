@implementation NSAutoresizingMaskLayoutConstraint

+ (id)constraintsWithAutoresizingMask:(unint64_t)a3 subitem:(id)a4 frame:(CGRect)a5 superitem:(id)a6 bounds:(CGRect)a7
{
  char v7;

  if (a3)
  {
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    __asm { BR              X10 }
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", 0, a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
}

+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 constant:(double)a9
{
  char *v16;

  if (a3
    && a4 <= 0x25
    && ((1 << a4) & 0x3F001FFE7FLL) != 0
    && (a4 - 32) >= 6
    && (_DWORD)a4
    || a6
    && a7 <= 0x25
    && ((1 << a7) & 0x3F001FFE7FLL) != 0
    && (a7 - 32) >= 6
    && (_DWORD)a7)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown layout attribute"), 0));
  }
  v16 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v16 + 66) |= 0x40u;
  objc_msgSend(v16, "_setFirstItem:attribute:", a3, a4);
  objc_msgSend(v16, "_setRelation:", a5);
  if (a6 && a8 != 0.0)
  {
    objc_msgSend(v16, "_setMultiplier:", a8);
    objc_msgSend(v16, "_setSecondItem:attribute:", a6, a7);
  }
  objc_msgSend(v16, "setConstant:", a9);
  ConstraintDidPerformInitialSetup((uint64_t)v16);
  return v16;
}

- (id)_viewForAutoresizingMask
{
  id v3;
  id v4;
  void *v5;

  v3 = -[NSLayoutConstraint firstItem](self, "firstItem");
  v4 = -[NSLayoutConstraint secondItem](self, "secondItem");
  if (v4)
  {
    v5 = v4;
    if ((id)objc_msgSend(v3, "nsli_superitem") != v4)
      return v5;
  }
  return v3;
}

- (id)descriptionAccessory
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = objc_msgSend(-[NSAutoresizingMaskLayoutConstraint _viewForAutoresizingMask](self, "_viewForAutoresizingMask"), "nsli_autoresizingMask");
  v3 = 38;
  if ((v2 & 0x20) != 0)
    v4 = 38;
  else
    v4 = 45;
  if ((v2 & 0x10) != 0)
    v5 = 38;
  else
    v5 = 45;
  v11 = v5;
  v12 = v4;
  if ((v2 & 8) != 0)
    v6 = 38;
  else
    v6 = 45;
  if ((v2 & 4) != 0)
    v7 = 38;
  else
    v7 = 45;
  v10 = v6;
  if ((v2 & 2) != 0)
    v8 = 38;
  else
    v8 = 45;
  if ((v2 & 1) == 0)
    v3 = 45;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("h=%c%c%c v=%c%c%c"), v3, v8, v7, v10, v11, v12);
}

- (int)_constraintType
{
  NSAutoresizingMaskLayoutConstraint *v2;
  uint64_t v3;
  id v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  char *v8;
  int v9;
  double v10;
  BOOL v11;
  int v12;
  int v13;
  double v14;

  if (self)
  {
    v2 = self;
    v3 = *(unsigned int *)((char *)&self->super._layoutConstraintFlags + 2);
    if ((v3 & 4) == 0
      || (self = (NSAutoresizingMaskLayoutConstraint *)(v3 << 40 >> 56), (int)((_DWORD)v3 << 8) >> 24 == -1))
    {
      v4 = -[NSLayoutConstraint firstItem](v2, "firstItem");
      v5 = -[NSLayoutConstraint firstAttribute](v2, "firstAttribute");
      v6 = -[NSLayoutConstraint secondItem](v2, "secondItem");
      v7 = -[NSLayoutConstraint secondAttribute](v2, "secondAttribute");
      if (v4 && !v6)
      {
        LODWORD(self) = 9;
        if (v5 <= 0x25 && ((1 << v5) & 0x3C001D5FD5) != 0)
          LODWORD(self) = dword_1A373F4E0[v5];
        goto LABEL_18;
      }
      LODWORD(self) = 0;
      if (!v4 || !v6)
      {
LABEL_18:
        v9 = *(_DWORD *)((char *)&v2->super._layoutConstraintFlags + 2);
        v8 = (char *)&v2->super._layoutConstraintFlags + 2;
        *((_WORD *)v8 + 2) = *((_WORD *)v8 + 2);
        *(_DWORD *)v8 = v9 & 0xFF00FFFF | ((_DWORD)self << 16) | 4;
        return (int)self;
      }
      if (v5 <= 0x25 && ((1 << v5) & 0x3F001FFE7FLL) != 0)
      {
        if (((0x3C001D5FD5uLL >> v5) & 1) != 0
          || v7 < 0x26 && ((0x3F001FFE7FuLL >> v7) & 1) != 0
          || (id)objc_msgSend(v4, "nsli_superitem") != v6)
        {
LABEL_17:
          LODWORD(self) = 0;
          goto LABEL_18;
        }
        -[NSLayoutConstraint constant](v2, "constant");
        v11 = v10 == 0.0;
        v12 = 13;
        v13 = 11;
      }
      else
      {
        if (v7 > 0x23 || ((1 << v7) & 0xF001ABFABLL) == 0)
        {
          if (v4 == (id)objc_msgSend(v6, "nsli_superitem"))
            LODWORD(self) = 10;
          else
            LODWORD(self) = 0;
          goto LABEL_18;
        }
        if (((0xF001FFE7FuLL >> v7) & 1) != 0 || (id)objc_msgSend(v4, "nsli_superitem") != v6)
          goto LABEL_17;
        -[NSLayoutConstraint constant](v2, "constant");
        v11 = v14 == 0.0;
        v12 = 14;
        v13 = 12;
      }
      if (v11)
        LODWORD(self) = v12;
      else
        LODWORD(self) = v13;
      goto LABEL_18;
    }
  }
  return (int)self;
}

@end
