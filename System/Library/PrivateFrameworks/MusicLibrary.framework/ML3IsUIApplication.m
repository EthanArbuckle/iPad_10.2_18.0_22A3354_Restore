@implementation ML3IsUIApplication

void __ML3IsUIApplication_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ML3IsUIApplication___isUIApplication = objc_msgSend(v0, "isApplication");

}

@end
