@implementation NUArticleLoadLog

void __NUArticleLoadLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "ArticleLoad");
  v1 = (void *)NUArticleLoadLog_result;
  NUArticleLoadLog_result = (uint64_t)v0;

}

@end
