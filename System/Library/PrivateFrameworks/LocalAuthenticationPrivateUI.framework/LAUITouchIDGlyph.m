@implementation LAUITouchIDGlyph

- (LAUITouchIDGlyph)initWithStyle:(int64_t)a3
{
  LAUITouchIDGlyph *v4;
  uint64_t v5;
  LAUIPKGlyphWrapper *glyph;
  uint64_t v7;
  UIImpactFeedbackGenerator *hapticGenerator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LAUITouchIDGlyph;
  v4 = -[LAUITouchIDGlyph init](&v10, sel_init);
  if (v4)
  {
    +[LAUIPKGlyphWrapper glyphWithStyle:frame:](LAUIPKGlyphWrapper, "glyphWithStyle:frame:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v5 = objc_claimAutoreleasedReturnValue();
    glyph = v4->_glyph;
    v4->_glyph = (LAUIPKGlyphWrapper *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AF0]), "initWithStyle:", 2);
    hapticGenerator = v4->_hapticGenerator;
    v4->_hapticGenerator = (UIImpactFeedbackGenerator *)v7;

    -[UIImpactFeedbackGenerator prepare](v4->_hapticGenerator, "prepare");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[LAUIPKGlyphWrapper view](self->_glyph, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)LAUITouchIDGlyph;
  -[LAUITouchIDGlyph dealloc](&v4, sel_dealloc);
}

- (UIView)view
{
  return -[LAUIPKGlyphWrapper view](self->_glyph, "view");
}

- (void)setState:(int64_t)a3
{
  uint64_t v3;

  self->_state = a3;
  if (a3 == 2)
    v3 = 11;
  else
    v3 = a3 == 1;
  -[LAUIPKGlyphWrapper setState:idleTouchID:animated:completionHandler:](self->_glyph, "setState:idleTouchID:animated:completionHandler:", v3, 0, 1, &__block_literal_global_3);
}

- (void)shake
{
  void *v3;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[UIImpactFeedbackGenerator impactOccurred](self->_hapticGenerator, "impactOccurred");
  CGAffineTransformMakeTranslation(&v6, 20.0, 0.0);
  -[LAUITouchIDGlyph view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v3, "setTransform:", &v5);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__LAUITouchIDGlyph_shake__block_invoke;
  v4[3] = &unk_24C27EBE8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v4, 0, 0.4, 0.0, 0.03, 1.2);
}

void __25__LAUITouchIDGlyph_shake__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
