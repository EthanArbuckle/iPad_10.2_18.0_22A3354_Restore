@implementation NSString(SFExtras_Private)

- (uint64_t)sf_cardSectionType
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("title")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("rich_title")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("website")) & 1) != 0)
  {
    return 2;
  }
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("app_link_list")) & 1) != 0)
    return 15;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("track_list")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("row")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("description")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("movie_info")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("trailers")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("twitter")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("hashtags")) & 1) != 0)
  {
    return 7;
  }
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("meta_info")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("sports_summary_card")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("movie_list")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("data_card_with_image")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("card_row_table")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("detailed_row")) & 1) != 0)
    return 13;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("text_columns")) & 1) != 0)
    return 14;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("stock_chart")) & 1) != 0)
    return 17;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("web")) & 1) != 0)
    return 18;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("flight")) & 1) != 0)
    return 19;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("suggestion")) & 1) != 0)
    return 20;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("watch_list")))
    return 21;
  return 0;
}

@end
