@implementation NSAttributedStringLoadCMarkIfNeeded

void *___NSAttributedStringLoadCMarkIfNeeded_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/libcmark-gfm.dylib", 256);
  v1 = result;
  if (result)
  {
    _NS_cmark_node_get_type = (uint64_t (*)(void))dlsym(result, "cmark_node_get_type");
    _MergedGlobals_110 = (uint64_t)dlsym(v1, "cmark_node_first_child");
    qword_1ECD09F50 = (uint64_t)dlsym(v1, "cmark_node_next");
    _NS_cmark_node_get_literal = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_literal");
    _NS_cmark_node_get_list_type = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_list_type");
    _NS_cmark_node_get_list_start = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_list_start");
    _NS_cmark_node_get_heading_level = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_heading_level");
    _NS_cmark_node_get_url = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_url");
    _NS_cmark_node_get_title = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_title");
    _NS_cmark_node_get_attributes = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_attributes");
    _NS_cmark_node_free = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_free");
    _NS_cmark_iter_new = (uint64_t (*)(void))dlsym(v1, "cmark_iter_new");
    _NS_cmark_iter_free = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_iter_free");
    _NS_cmark_iter_next = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_iter_next");
    _NS_cmark_iter_get_node = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_iter_get_node");
    qword_1ECD09F58 = (uint64_t)dlsym(v1, "cmark_iter_get_event_type");
    qword_1ECD09F60 = (uint64_t)dlsym(v1, "cmark_render_commonmark");
    _NS_cmark_node_get_fence_info = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_fence_info");
    _NS_cmark_node_get_user_data = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_user_data");
    _NS_cmark_node_set_user_data = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "cmark_node_set_user_data");
    off_1ECD09F68 = (uint64_t (*)(void))dlsym(v1, "cmark_gfm_core_extensions_ensure_registered");
    _NS_cmark_parser_attach_syntax_extension = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "cmark_parser_attach_syntax_extension");
    _NS_cmark_find_syntax_extension = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_find_syntax_extension");
    _NS_cmark_parser_new = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_parser_new");
    qword_1ECD09F70 = (uint64_t)dlsym(v1, "cmark_parser_new_with_mem");
    _NS_cmark_parser_free = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_parser_free");
    _NS_cmark_parser_feed = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v1, "cmark_parser_feed");
    _NS_cmark_parser_finish = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_parser_finish");
    _NS_CMARK_NODE_STRIKETHROUGH = (uint64_t)dlsym(v1, "CMARK_NODE_STRIKETHROUGH");
    _NS_CMARK_NODE_TABLE = (uint64_t)dlsym(v1, "CMARK_NODE_TABLE");
    _NS_CMARK_NODE_TABLE_ROW = (uint64_t)dlsym(v1, "CMARK_NODE_TABLE_ROW");
    _NS_CMARK_NODE_TABLE_CELL = (uint64_t)dlsym(v1, "CMARK_NODE_TABLE_CELL");
    _NS_cmark_gfm_extensions_get_table_columns = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_gfm_extensions_get_table_columns");
    _NS_cmark_gfm_extensions_get_table_alignments = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_gfm_extensions_get_table_alignments");
    _NS_cmark_gfm_extensions_get_table_row_is_header = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_gfm_extensions_get_table_row_is_header");
    _NS_cmark_node_get_start_line = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_start_line");
    _NS_cmark_node_get_start_column = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_start_column");
    _NS_cmark_node_get_end_line = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_end_line");
    _NS_cmark_node_get_end_column = (uint64_t (*)(_QWORD))dlsym(v1, "cmark_node_get_end_column");
    result = (void *)off_1ECD09F68();
  }
  _NSAttributedStringLoadCMarkIfNeeded_cmarkLoaded = v1 != 0;
  return result;
}

@end
