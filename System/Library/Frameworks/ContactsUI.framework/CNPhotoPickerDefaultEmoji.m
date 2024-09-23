@implementation CNPhotoPickerDefaultEmoji

- (CNPhotoPickerDefaultEmoji)initWithEmojiString:(id)a3 colorVariant:(id)a4
{
  id v7;
  id v8;
  CNPhotoPickerDefaultEmoji *v9;
  CNPhotoPickerDefaultEmoji *v10;
  CNPhotoPickerDefaultEmoji *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerDefaultEmoji;
  v9 = -[CNPhotoPickerDefaultEmoji init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_emojiString, a3);
    objc_storeStrong((id *)&v10->_colorVariant, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (void)setEmojiString:(id)a3
{
  objc_storeStrong((id *)&self->_emojiString, a3);
}

- (CNPhotoPickerColorVariant)colorVariant
{
  return self->_colorVariant;
}

- (void)setColorVariant:(id)a3
{
  objc_storeStrong((id *)&self->_colorVariant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorVariant, 0);
  objc_storeStrong((id *)&self->_emojiString, 0);
}

@end
