@implementation HMIHLSPlaylist

- (HMIHLSPlaylist)initWithPlaylistString:(id)a3
{
  id v4;
  HMIHLSPlaylist *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *lines;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMIHLSPlaylist;
  v5 = -[HMIHLSPlaylist init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    lines = v5->_lines;
    v5->_lines = (NSMutableArray *)v7;

  }
  return v5;
}

- (HMIHLSPlaylist)initWithTargetDuration:(double)a3
{
  HMIHLSPlaylist *v4;
  uint64_t v5;
  NSMutableArray *lines;
  NSMutableArray *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMIHLSPlaylist;
  v4 = -[HMIHLSPlaylist init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    lines = v4->_lines;
    v4->_lines = (NSMutableArray *)v5;

    -[NSMutableArray addObject:](v4->_lines, "addObject:", CFSTR("#EXTM3U"));
    -[NSMutableArray addObject:](v4->_lines, "addObject:", CFSTR("#EXT-X-VERSION:7"));
    v7 = v4->_lines;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#EXT-X-TARGETDURATION:%.6f"), *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    -[NSMutableArray addObject:](v4->_lines, "addObject:", CFSTR("#EXT-X-PLAYLIST-TYPE:VOD"));
    -[NSMutableArray addObject:](v4->_lines, "addObject:", CFSTR("#EXT-X-INDEPENDENT-SEGMENTS"));
  }
  return v4;
}

- (NSString)playlistString
{
  void *v2;
  void *v3;

  -[HMIHLSPlaylist lines](self, "lines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)appendIFrameOnly
{
  -[NSMutableArray addObject:](self->_lines, "addObject:", CFSTR("#EXT-X-I-FRAMES-ONLY"));
}

- (void)appendEncryptionModeWithPath:(id)a3
{
  NSMutableArray *lines;
  id v4;

  lines = self->_lines;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#EXT-X-KEY:METHOD=AES-256-GCM,URI=\"%@\"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](lines, "addObject:", v4);

}

- (void)appendInitializationSegmentWithPath:(id)a3
{
  NSMutableArray *lines;
  id v4;

  lines = self->_lines;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#EXT-X-MAP:URI=\"%@\"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](lines, "addObject:", v4);

}

- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4
{
  -[HMIHLSPlaylist appendSeparableSegmentWithPath:duration:byteRange:](self, "appendSeparableSegmentWithPath:duration:byteRange:", a3, 0, 0, a4);
}

- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4 byteRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *lines;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;

  length = a5.length;
  location = a5.location;
  v15 = a3;
  lines = self->_lines;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#EXTINF:%.5f"), *(_QWORD *)&a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](lines, "addObject:", v10);

  if (length)
  {
    v11 = self->_lines;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#EXT-X-BYTERANGE:%lu@%lu"), length, location);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v11, "addObject:", v12);

  }
  v13 = self->_lines;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v13, "addObject:", v14);

}

- (void)open
{
  -[NSMutableArray removeLastObject](self->_lines, "removeLastObject");
}

- (void)end
{
  -[NSMutableArray addObject:](self->_lines, "addObject:", CFSTR("#EXT-X-ENDLIST"));
}

- (NSMutableArray)lines
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
}

@end
