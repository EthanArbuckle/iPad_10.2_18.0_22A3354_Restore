@implementation AVMetadataItemFilterForSharing

+ (void)addKeySpace:(id)a3 key:(id)a4 toWhitelistDictionary:(id)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(a5, "objectForKey:");
  if (!v8)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(a5, "setObject:forKey:", v8, a3);
  }
  objc_msgSend(v8, "addObject:", a4);
}

+ (void)addIdentifier:(id)a3 toWhitelistDictionary:(id)a4
{
  NSString *v6;
  id v7;
  BOOL v8;

  v6 = +[AVMetadataItem keySpaceForIdentifier:](AVMetadataItem, "keySpaceForIdentifier:");
  v7 = +[AVMetadataItem keyForIdentifier:](AVMetadataItem, "keyForIdentifier:", a3);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
    +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", v6, v7, a4);
}

- (id)whitelist
{
  if (whitelist_onceToken != -1)
    dispatch_once(&whitelist_onceToken, &__block_literal_global_343);
  return (id)whitelist_sWhitelist;
}

uint64_t __43__AVMetadataItemFilterForSharing_whitelist__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("copyrights"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.copyright"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@cpy"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("uiso"), CFSTR("cprt"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TCOP"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("WCOP"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("cprt"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.phonogramrights"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@phg"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("@phg"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("akID"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("apID"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("make"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.make"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@mak"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("model"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.model"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@mod"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("software"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.software"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@swr"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("@too"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("creationDate"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.creationdate"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@day"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TDAT"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("language"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("comn"), CFSTR("identifier"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("@req"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("udta"), CFSTR("tagc"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("uiso"), CFSTR("tagc"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("AENC"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("ENCR"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("UFID"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.content.identifier"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.live-photo.video-stabilization-crop-percentage-numerator"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.live-photo.video-stabilization-crop-percentage-denominator"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.is-montage"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("mdta"), CFSTR("com.apple.quicktime.live-photo.vitality-disabled"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itlk"), CFSTR("com.apple.iTunes.iTunSMPB"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itlk"), CFSTR("com.apple.iTunes.iTunNORM"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("uiso"), CFSTR("ludt"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("com.apple.quicktime.udta"), CFSTR("ludt"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("uiso"), CFSTR("thmb"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("itsk"), CFSTR("tmpo"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TBPM"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TLEN"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TMED"), v0);
  +[AVMetadataItemFilterForSharing addKeySpace:key:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addKeySpace:key:toWhitelistDictionary:", CFSTR("org.id3"), CFSTR("TSIZ"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.detected-face"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", *MEMORY[0x1E0CA4C18], v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", *MEMORY[0x1E0CA4C10], v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", *MEMORY[0x1E0CA4C20], v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", *MEMORY[0x1E0CA4C28], v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", *MEMORY[0x1E0CA4CC0], v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.preferred-affine-transform"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.video-orientation"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.live-photo.auto"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.live-photo.vitality-score"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.live-photo.vitality-scoring-version"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.spatial-overcapture.quality-score"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.spatial-overcapture.quality-scoring-version"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.camera.lens_model"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.camera.focal_length.35mm_equivalent"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.full-frame-rate-playback-intent"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.spatial.format-version"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.spatial.low-motion"), v0);
  +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.spatial.aggressors-seen"), v0);
  result = +[AVMetadataItemFilterForSharing addIdentifier:toWhitelistDictionary:](AVMetadataItemFilterForSharing, "addIdentifier:toWhitelistDictionary:", CFSTR("mdta/com.apple.quicktime.aime-data"), v0);
  whitelist_sWhitelist = (uint64_t)v0;
  return result;
}

@end
