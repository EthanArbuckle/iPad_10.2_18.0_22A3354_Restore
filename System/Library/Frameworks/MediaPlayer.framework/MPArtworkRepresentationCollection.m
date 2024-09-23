@implementation MPArtworkRepresentationCollection

- (MPArtworkRepresentation)imageRepresentation
{
  return self->_imageRepresentation;
}

- (MPArtworkRepresentation)videoRepresentation
{
  return self->_videoRepresentation;
}

- (BOOL)isBestRepresentationForKind:(int64_t)a3
{
  return ((1 << a3) & ~-[MPArtworkRepresentationCollection bestRepresentationKinds](self, "bestRepresentationKinds")) == 0;
}

+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4 bestRepresentationKinds:(unint64_t)a5
{
  id v7;
  id v8;
  MPArtworkRepresentationCollection *v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MPArtworkRepresentationCollection);
  -[MPArtworkRepresentationCollection setImageRepresentation:](v9, "setImageRepresentation:", v8);

  -[MPArtworkRepresentationCollection setVideoRepresentation:](v9, "setVideoRepresentation:", v7);
  -[MPArtworkRepresentationCollection setBestRepresentationKinds:](v9, "setBestRepresentationKinds:", a5);
  return v9;
}

- (void)resetForRepresentationKinds:(unint64_t)a3
{
  char v3;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    -[MPArtworkRepresentationCollection setImageRepresentation:](self, "setImageRepresentation:", 0);
    -[MPArtworkRepresentationCollection setBestRepresentationKinds:](self, "setBestRepresentationKinds:", -[MPArtworkRepresentationCollection bestRepresentationKinds](self, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFELL);
  }
  if ((v3 & 2) != 0)
  {
    -[MPArtworkRepresentationCollection setVideoRepresentation:](self, "setVideoRepresentation:", 0);
    -[MPArtworkRepresentationCollection setBestRepresentationKinds:](self, "setBestRepresentationKinds:", -[MPArtworkRepresentationCollection bestRepresentationKinds](self, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFDLL);
  }
}

- (void)setBestRepresentationKinds:(unint64_t)a3
{
  self->_bestRepresentationKinds = a3;
}

- (unint64_t)bestRepresentationKinds
{
  return self->_bestRepresentationKinds;
}

- (void)setVideoRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_videoRepresentation, a3);
}

- (void)setImageRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_imageRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoRepresentation, 0);
  objc_storeStrong((id *)&self->_imageRepresentation, 0);
}

+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4
{
  return (MPArtworkRepresentationCollection *)objc_msgSend(a1, "collectionWithImageRepresentation:videoRepresentation:bestRepresentationKinds:", a3, a4, 3);
}

@end
