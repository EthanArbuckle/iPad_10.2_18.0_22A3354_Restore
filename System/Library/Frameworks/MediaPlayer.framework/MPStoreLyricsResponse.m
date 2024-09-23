@implementation MPStoreLyricsResponse

- (NSString)lyricsContent
{
  return self->_lyricsContent;
}

- (void)setLyricsContent:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsContent, a3);
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsID:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_lyricsContent, 0);
}

@end
