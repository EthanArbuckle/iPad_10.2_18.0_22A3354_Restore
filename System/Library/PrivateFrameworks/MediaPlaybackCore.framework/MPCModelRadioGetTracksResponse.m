@implementation MPCModelRadioGetTracksResponse

- (MPCModelRadioGetTracksResponse)initWithTracks:(id)a3 tracklistAction:(int64_t)a4
{
  id v6;
  MPCModelRadioGetTracksResponse *v7;
  MPCModelRadioGetTracksResponse *v8;
  uint64_t v9;
  MPSectionedCollection *tracks;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelRadioGetTracksResponse;
  v7 = -[MPCModelRadioGetTracksResponse init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_tracklistAction = a4;
    v9 = objc_msgSend(v6, "copy");
    tracks = v8->_tracks;
    v8->_tracks = (MPSectionedCollection *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  int64_t tracklistAction;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  tracklistAction = self->_tracklistAction;
  if (tracklistAction)
  {
    if (tracklistAction == 1)
    {
      v5 = CFSTR("Replace");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown-%ld"), self->_tracklistAction);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("Append");
  }
  v6 = -[MPSectionedCollection totalItemCount](self->_tracks, "totalItemCount");
  -[MPSectionedCollection allItems](self->_tracks, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPCModelRadioGetTracksResponse: %p action=%@> tracks.count=%ld tracks=%@"), self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)tracklistAction
{
  return self->_tracklistAction;
}

- (MPSectionedCollection)tracks
{
  return self->_tracks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
}

@end
