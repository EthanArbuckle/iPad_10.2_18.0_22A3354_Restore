@implementation _NUVideoProperties

- (_NUVideoProperties)initWithProperties:(id)a3
{
  id v4;
  _NUVideoProperties *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_NUVideoProperties;
  v5 = -[_NUVideoProperties init](&v33, sel_init);
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setUrl:](v5, "setUrl:", v6);

  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setMetadata:](v5, "setMetadata:", v7);

  v8 = objc_msgSend(v4, "size");
  -[_NUVideoProperties setSize:](v5, "setSize:", v8, v9);
  v10 = objc_msgSend(v4, "originalSize");
  -[_NUVideoProperties setOriginalSize:](v5, "setOriginalSize:", v10, v11);
  if (v4)
  {
    objc_msgSend(v4, "cleanAperture");
    v29 = v31;
    v30 = v32;
    -[_NUVideoProperties setCleanAperture:](v5, "setCleanAperture:", &v29);
    objc_msgSend(v4, "originalCleanAperture");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[_NUVideoProperties setCleanAperture:](v5, "setCleanAperture:", &v29);
    v27 = 0u;
    v28 = 0u;
  }
  v26[0] = v27;
  v26[1] = v28;
  -[_NUVideoProperties setOriginalCleanAperture:](v5, "setOriginalCleanAperture:", v26);
  -[_NUVideoProperties setOrientation:](v5, "setOrientation:", objc_msgSend(v4, "orientation"));
  objc_msgSend(v4, "nominalFrameRate");
  -[_NUVideoProperties setNominalFrameRate:](v5, "setNominalFrameRate:");
  objc_msgSend(v4, "colorProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setColorProperties:](v5, "setColorProperties:", v12);

  if (v4)
  {
    objc_msgSend(v4, "livePhotoKeyFrameTime");
    v22 = v24;
    v23 = v25;
    -[_NUVideoProperties setLivePhotoKeyFrameTime:](v5, "setLivePhotoKeyFrameTime:", &v22);
    objc_msgSend(v4, "duration");
  }
  else
  {
    v24 = 0uLL;
    v25 = 0;
    v23 = 0;
    v22 = 0uLL;
    -[_NUVideoProperties setLivePhotoKeyFrameTime:](v5, "setLivePhotoKeyFrameTime:", &v22);
    v20 = 0uLL;
    v21 = 0;
  }
  v18 = v20;
  v19 = v21;
  -[_NUVideoProperties setDuration:](v5, "setDuration:", &v18);
  objc_msgSend(v4, "trackGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setTrackGroups:](v5, "setTrackGroups:", v13);

  objc_msgSend(v4, "trackMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setTrackMetadata:](v5, "setTrackMetadata:", v14);

  objc_msgSend(v4, "auxiliaryVideoTrackProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setAuxiliaryVideoTrackProperties:](v5, "setAuxiliaryVideoTrackProperties:", v15);

  objc_msgSend(v4, "cinematicAudioMixInputParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties setCinematicAudioMixInputParameters:](v5, "setCinematicAudioMixInputParameters:", v16);

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUVideoProperties url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoProperties metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_NUVideoProperties size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_NUVideoProperties orientation](self, "orientation");
  if ((unint64_t)(v10 - 9) >= 0xFFFFFFFFFFFFFFF8)
    v11 = v10;
  else
    v11 = 0;
  v12 = NUOrientationName_names[v11];
  -[_NUVideoProperties colorProperties](self, "colorProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> url=%@ metadata=%@ size=%@ orientation=%@ color=%@"), v4, self, v5, v6, v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)metadataItemForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_16192();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16192();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2114;
        v33 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUVideoProperties metadataItemForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoProperties.m", 45, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"key != nil");
  }
  v5 = v4;
  -[_NUVideoProperties metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __41___NUVideoProperties_metadataItemForKey___block_invoke;
  v28[3] = &unk_1E5062A20;
  v7 = v5;
  v29 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v28);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[_NUVideoProperties metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)isHDR
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NUGlobalSettings enableHDRSupport](NUGlobalSettings, "enableHDRSupport");
  if (v3)
  {
    if (+[NUGlobalSettings allAssetsCanUseHDRPipeline](NUGlobalSettings, "allAssetsCanUseHDRPipeline"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[_NUVideoProperties colorProperties](self, "colorProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[_NUVideoProperties colorProperties](self, "colorProperties");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUColorSpace colorSpaceFromVideoColorProperties:](NUColorSpace, "colorSpaceFromVideoColorProperties:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v5) = objc_msgSend(v6, "isHDR");
        LOBYTE(v3) = (_BYTE)v5;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_size.height;
  width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setSize:(id)a3
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalSize
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_originalSize.height;
  width = self->_originalSize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setOriginalSize:(id)a3
{
  self->_originalSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)cleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[5].var1;
  retstr->var0 = self[5].var0;
  retstr->var1 = var1;
  return self;
}

- (void)setCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_cleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_cleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)originalCleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[6].var1;
  retstr->var0 = self[6].var0;
  retstr->var1 = var1;
  return self;
}

- (void)setOriginalCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_originalCleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_originalCleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (float)nominalFrameRate
{
  return self->_nominalFrameRate;
}

- (void)setNominalFrameRate:(float)a3
{
  self->_nominalFrameRate = a3;
}

- (NSDictionary)colorProperties
{
  return self->_colorProperties;
}

- (void)setColorProperties:(id)a3
{
  objc_storeStrong((id *)&self->_colorProperties, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setLivePhotoKeyFrameTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoKeyFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoKeyFrameTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (NSArray)trackGroups
{
  return self->_trackGroups;
}

- (void)setTrackGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)trackMetadata
{
  return self->_trackMetadata;
}

- (void)setTrackMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)auxiliaryVideoTrackProperties
{
  return self->_auxiliaryVideoTrackProperties;
}

- (void)setAuxiliaryVideoTrackProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (AVAudioMixInputParameters)cinematicAudioMixInputParameters
{
  return self->_cinematicAudioMixInputParameters;
}

- (void)setCinematicAudioMixInputParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cinematicAudioMixInputParameters, 0);
  objc_storeStrong((id *)&self->_auxiliaryVideoTrackProperties, 0);
  objc_storeStrong((id *)&self->_trackMetadata, 0);
  objc_storeStrong((id *)&self->_trackGroups, 0);
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
