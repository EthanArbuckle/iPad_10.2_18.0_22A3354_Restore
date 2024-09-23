@implementation JFXIsPlaybackSignpostsEnabled

void __JFXIsPlaybackSignpostsEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  JFXIsPlaybackSignpostsEnabled_s_enableSignposts = objc_msgSend(v0, "jfxBoolForKey:defaultValue:", CFSTR("JFXEnablePlaybackSignposts"), 1);

}

@end
