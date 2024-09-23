@implementation PKTranscriptionQuery

- (PKTranscriptionQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKTranscriptionQuery *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CHTranscriptionQuery *transcriptionQuery;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTranscriptionQuery;
  v5 = -[PKQuery initWithRecognitionSessionManager:](&v11, sel_initWithRecognitionSessionManager_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D168B0]);
    -[PKRecognitionSessionManager session](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithRecognitionSession:", v7);
    transcriptionQuery = v5->_transcriptionQuery;
    v5->_transcriptionQuery = (CHTranscriptionQuery *)v8;

  }
  return v5;
}

- (void)start
{
  id v2;

  -[PKTranscriptionQuery transcriptionQuery](self, "transcriptionQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)pause
{
  id v2;

  -[PKTranscriptionQuery transcriptionQuery](self, "transcriptionQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)teardown
{
  -[PKTranscriptionQuery pause](self, "pause");
  -[PKTranscriptionQuery setTranscriptionQuery:](self, "setTranscriptionQuery:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PKTranscriptionQuery teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)PKTranscriptionQuery;
  -[PKTranscriptionQuery dealloc](&v3, sel_dealloc);
}

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKTranscriptionQuery transcriptionQuery](self, "transcriptionQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextualTextResultsForContextStrokes:completion:shouldCancel:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (CHTranscriptionQuery)transcriptionQuery
{
  return self->_transcriptionQuery;
}

- (void)setTranscriptionQuery:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionQuery, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
}

@end
