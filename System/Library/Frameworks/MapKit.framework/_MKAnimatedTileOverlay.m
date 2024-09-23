@implementation _MKAnimatedTileOverlay

- (_MKAnimatedTileOverlay)initWithURLTemplate:(id)a3
{
  _MKAnimatedTileOverlay *v3;
  _MKAnimatedTileOverlay *v4;
  _MKAnimatedTileOverlay *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKAnimatedTileOverlay;
  v3 = -[MKTileOverlay initWithURLTemplate:](&v7, sel_initWithURLTemplate_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_keyframesCount = 1;
    v3->_duration = 5.0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)keyframesCount
{
  return self->_keyframesCount;
}

- (void)setKeyframesCount:(unint64_t)a3
{
  self->_keyframesCount = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleKeyframeOverride, 0);
}

- (id)URLForTilePath:(id *)a3 keyframeIndex:(unint64_t)a4
{
  void *v6;
  NSMutableString *v7;
  double var3;
  NSMutableString *v9;
  void *v10;
  NSMutableString *v11;
  void *v12;
  void *v13;

  -[MKTileOverlay URLTemplate](self, "URLTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableString *)objc_msgSend(v6, "mutableCopy");

  fillTemplate(v7, CFSTR("{x}"), a3->var0);
  fillTemplate(v7, CFSTR("{y}"), a3->var1);
  fillTemplate(v7, CFSTR("{z}"), a3->var2);
  var3 = a3->var3;
  v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&var3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{scale}"), v10, 0, 0, -[NSMutableString length](v9, "length"));

  v11 = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{keyframe}"), v12, 0, 0, -[NSMutableString length](v11, "length"));

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)loadTileAtPath:(id *)a3 keyframeIndex:(unint64_t)a4 result:(id)a5
{
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _OWORD v19[2];

  v8 = a5;
  v9 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v9;
  -[_MKAnimatedTileOverlay URLForTilePath:keyframeIndex:](self, "URLForTilePath:keyframeIndex:", v19, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v10, 1, 120.0);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77___MKAnimatedTileOverlay_CustomLoading__loadTileAtPath_keyframeIndex_result___block_invoke;
  v16[3] = &unk_1E20DF4D0;
  v16[4] = self;
  v13 = v10;
  v17 = v13;
  v14 = v8;
  v18 = v14;
  objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v11, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

@end
