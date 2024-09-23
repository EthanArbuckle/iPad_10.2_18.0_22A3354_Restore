@implementation AVSpeechSynthesisMarker

- (AVSpeechSynthesisMarker)initWithMarkerType:(AVSpeechSynthesisMarkerMark)type forTextRange:(NSRange)range atByteSampleOffset:(NSUInteger)byteSampleOffset
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithMarkerType:(int64_t)a3 name:(id)a4 forTextRange:(_NSRange)a5 atByteSampleOffset:(unint64_t)a6
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithBookmarkName:(NSString *)mark atByteSampleOffset:(NSInteger)byteSampleOffset
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithParagraphRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithPhonemeString:(NSString *)phoneme atByteSampleOffset:(NSInteger)byteSampleOffset
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithSentenceRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{

  return 0;
}

- (AVSpeechSynthesisMarker)initWithWordRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[AVSpeechSynthesisMarker mark](self, "mark"), CFSTR("mark"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[AVSpeechSynthesisMarker byteSampleOffset](self, "byteSampleOffset"), CFSTR("byteSampleOffset"));
  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = -[AVSpeechSynthesisMarker textRange](self, "textRange");
  objc_msgSend(v4, "valueWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("textRange"));

  -[AVSpeechSynthesisMarker phoneme](self, "phoneme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("phoneme"));

  -[AVSpeechSynthesisMarker bookmarkName](self, "bookmarkName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("bookmarkName"));

}

- (AVSpeechSynthesisMarker)initWithCoder:(id)a3
{
  id v4;
  AVSpeechSynthesisMarker *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AVSpeechSynthesisMarker *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVSpeechSynthesisMarker;
  v5 = -[AVSpeechSynthesisMarker init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisMarker setMark:](v5, "setMark:", objc_msgSend(v6, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byteSampleOffset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisMarker setByteSampleOffset:](v5, "setByteSampleOffset:", objc_msgSend(v7, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeValue");
    -[AVSpeechSynthesisMarker setTextRange:](v5, "setTextRange:", v9, v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisMarker setBookmarkName:](v5, "setBookmarkName:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneme"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisMarker setPhoneme:](v5, "setPhoneme:", v12);

    v13 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMark:", -[AVSpeechSynthesisMarker mark](self, "mark"));
  objc_msgSend(v4, "setByteSampleOffset:", -[AVSpeechSynthesisMarker byteSampleOffset](self, "byteSampleOffset"));
  v5 = -[AVSpeechSynthesisMarker textRange](self, "textRange");
  objc_msgSend(v4, "setTextRange:", v5, v6);
  -[AVSpeechSynthesisMarker bookmarkName](self, "bookmarkName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBookmarkName:", v7);

  -[AVSpeechSynthesisMarker phoneme](self, "phoneme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneme:", v8);

  return v4;
}

- (AVSpeechSynthesisMarkerMark)mark
{
  return self->_mark;
}

- (void)setMark:(AVSpeechSynthesisMarkerMark)mark
{
  self->_mark = mark;
}

- (NSUInteger)byteSampleOffset
{
  return self->_byteSampleOffset;
}

- (void)setByteSampleOffset:(NSUInteger)byteSampleOffset
{
  self->_byteSampleOffset = byteSampleOffset;
}

- (NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(NSRange)textRange
{
  self->_textRange = textRange;
}

- (NSString)bookmarkName
{
  return self->_bookmarkName;
}

- (void)setBookmarkName:(NSString *)bookmarkName
{
  objc_setProperty_nonatomic_copy(self, a2, bookmarkName, 24);
}

- (NSString)phoneme
{
  return self->_phoneme;
}

- (void)setPhoneme:(NSString *)phoneme
{
  objc_setProperty_nonatomic_copy(self, a2, phoneme, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneme, 0);
  objc_storeStrong((id *)&self->_bookmarkName, 0);
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
