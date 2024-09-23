@implementation JFXIsVideoWriterSignpostsEnabled

void __JFXIsVideoWriterSignpostsEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  JFXIsVideoWriterSignpostsEnabled_s_enableSignposts = objc_msgSend(v0, "jfxBoolForKey:defaultValue:", CFSTR("JFXEnableVideoWriterSignposts"), 1);

}

@end
