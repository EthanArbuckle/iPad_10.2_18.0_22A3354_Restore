@implementation ML3ExportSession

- (ML3ExportSession)initWithLibrary:(id)a3 outputStream:(id)a4
{
  id v7;
  id v8;
  ML3ExportSession *v9;
  ML3ExportSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ExportSession;
  v9 = -[ML3ExportSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputStream, a4);
    objc_storeStrong((id *)&v10->_library, a3);
  }

  return v10;
}

- (id)begin:(unsigned int)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)end
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportTrackAdded:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportTrackUpdated:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportTrackDeleted:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportPlaylistAdded:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportPlaylistDeleted:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportPlaylistUpdated:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportAlbumArtistAdded:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportAlbumArtistDeleted:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportAlbumArtistUpdated:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)exportAlbumUpdated:(unint64_t)a3
{
  -[ML3ExportSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
