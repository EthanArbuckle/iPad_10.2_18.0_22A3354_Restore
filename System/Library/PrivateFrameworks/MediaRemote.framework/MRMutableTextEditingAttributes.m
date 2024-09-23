@implementation MRMutableTextEditingAttributes

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->super._title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->super._title;
    self->super._title = v4;

  }
}

- (void)setPrompt:(id)a3
{
  NSString *v4;
  NSString *prompt;

  if (self->super._prompt != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    prompt = self->super._prompt;
    self->super._prompt = v4;

  }
}

- (void)setInputTraits:(_MRTextInputTraits *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->super._inputTraits.autocapitalizationType = *(_OWORD *)&a3->autocapitalizationType;
  v3 = *(_OWORD *)&a3->returnKeyType;
  v4 = *(_OWORD *)&a3->validTextRange.length;
  v5 = *(_OWORD *)a3->PINEntrySeparatorIndexes;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[2] = *(_OWORD *)&a3->PINEntrySeparatorIndexes[2];
  *(_OWORD *)self->super._inputTraits.PINEntrySeparatorIndexes = v5;
  *(_OWORD *)&self->super._inputTraits.validTextRange.length = v4;
  *(_OWORD *)&self->super._inputTraits.returnKeyType = v3;
  v6 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[4];
  v7 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[6];
  v8 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[8];
  self->super._inputTraits.PINEntrySeparatorIndexesCount = a3->PINEntrySeparatorIndexesCount;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[8] = v8;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[6] = v7;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[4] = v6;
}

@end
