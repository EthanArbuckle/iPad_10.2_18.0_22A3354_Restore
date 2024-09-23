@implementation NTArticleIDsRequestWithArticles

void __NTArticleIDsRequestWithArticles_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "articleID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v4);

}

@end
