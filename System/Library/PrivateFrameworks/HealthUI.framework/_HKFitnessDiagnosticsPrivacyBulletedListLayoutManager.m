@implementation _HKFitnessDiagnosticsPrivacyBulletedListLayoutManager

- (void)setBullet:(id)a3
{
  id v4;
  NSAttributedString *v5;
  NSAttributedString *bullet;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;

  v4 = a3;
  v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
  bullet = self->_bullet;
  self->_bullet = v5;

  objc_msgSend(v4, "size");
  v8 = v7;
  v10 = v9;

  self->_bulletSize.width = v8;
  self->_bulletSize.height = v10;
  -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager textStorage](self, "textStorage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", 0, objc_msgSend(v11, "length"));

}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  objc_super v19;

  length = a3.length;
  location = a3.location;
  v19.receiver = self;
  v19.super_class = (Class)_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager;
  -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager drawGlyphsForGlyphRange:atPoint:](&v19, sel_drawGlyphsForGlyphRange_atPoint_, a4.x, a4.y);
  -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager bullet](self, "bullet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC1290];
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "defaultWritingDirectionForLanguage:", v12);

    if (v13 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFitnessDiagnosticsPrivacyDetailsCell.m"), 250, CFSTR("Unexpectedly received unresolved writing direction"));

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89___HKFitnessDiagnosticsPrivacyBulletedListLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke;
    v16[3] = &unk_1E9C412A0;
    v16[4] = self;
    v17 = v9;
    v18 = v13;
    v14 = v9;
    -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", location, length, v16);

  }
}

- (NSAttributedString)bullet
{
  return self->_bullet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bullet, 0);
}

@end
