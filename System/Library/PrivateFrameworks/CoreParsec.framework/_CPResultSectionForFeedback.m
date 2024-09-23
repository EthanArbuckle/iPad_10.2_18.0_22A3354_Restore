@implementation _CPResultSectionForFeedback

- (_CPResultSectionForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPResultSectionForFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPSearchResultForFeedback *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _CPButtonForFeedback *v22;
  void *v23;
  _CPButtonForFeedback *v24;
  _CPResultSectionForFeedback *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_CPResultSectionForFeedback;
  v5 = -[_CPResultSectionForFeedback init](&v31, sel_init);
  if (!v5)
    goto LABEL_378;
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v7 = 0;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "results", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = -[_CPSearchResultForFeedback initWithFacade:]([_CPSearchResultForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  -[_CPResultSectionForFeedback setResults:](v5, "setResults:", v7);
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPResultSectionForFeedback setIdentifier:](v5, "setIdentifier:", v15);

  }
  objc_msgSend(v4, "rankingScore");
  -[_CPResultSectionForFeedback setRankingScore:](v5, "setRankingScore:");
  objc_msgSend(v4, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "compare:options:", CFSTR("unknown"), 3))
    {
      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.web_index"), 3))
      {
        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.application"), 3))
        {
          v18 = 3;
          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.preferences"), 3))
          {
            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobilemail"), 3))
            {
              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobilesafari"), 3))
              {
                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobilesms"), 3))
                {
                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.stocks"), 3))
                  {
                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.stocks"), 3))
                    {
                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.taptoradar"), 3))
                      {
                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.searchd.zkw.apps"), 3))
                        {
                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.searchd.suggestions"), 3))
                          {
                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.podcasts"), 3))
                            {
                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobileaddressbook"), 3))
                              {
                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.documentsapp"), 3))
                                {
                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                  {
                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.clouddocs.mobiledocumentsfileprovider"), 3))
                                    {
                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.music"), 3))
                                      {
                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobilecal"), 3))
                                        {
                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other:search_web"), 3))
                                          {
                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other:search_app_store"), 3))
                                            {
                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other:search_maps"), 3))
                                              {
                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.usertypedstring"), 3))
                                                {
                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.parsec"), 3))
                                                  {
                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other:taptoradar"), 3))
                                                    {
                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlightui.search-through"), 3))
                                                      {
                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.weather"), 3))
                                                        {
                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.maps"), 3))
                                                          {
                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("google_comp"), 3))
                                                            {
                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("history"), 3))
                                                              {
                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.searchenginesuggestion"), 3))
                                                                {
                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("google_search"), 3))
                                                                  {
                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.usertypedstring"), 3))
                                                                    {
                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.history"), 3))
                                                                      {
                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.findonpage"), 3))
                                                                        {
                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("tophit"), 3))
                                                                          {
                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.tophit"), 3))
                                                                            {
                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("icloud_tab"), 3))
                                                                              {
                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.recentsearch"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("bookmark"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("yahoo_comp"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.bookmarks"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("bing_comp"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.restoredsearchcompletion"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("ddg_comp"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("yahoo_search"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.atebits.tweetie2"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("address_box"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.local"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("ddg_search"), 3))
                                                                                                          {
                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("bing_search"), 3))
                                                                                                            {
                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.news"), 3))
                                                                                                              {
                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                                                                                                {
                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.giphy.giphyformessenger"), 3))
                                                                                                                  {
                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.settings"), 3))
                                                                                                                    {
                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                      {
                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("net.whatsapp.whatsapp"), 3))
                                                                                                                        {
                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.applications"), 3))
                                                                                                                          {
                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.riffsy.riffsykeyboard"), 3))
                                                                                                                            {
                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.contact"), 3))
                                                                                                                              {
                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.yelp.yelpiphone"), 3))
                                                                                                                                {
                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.microsoft.office.outlook"), 3))
                                                                                                                                  {
                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("pinterest"), 3))
                                                                                                                                    {
                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail"), 3))
                                                                                                                                      {
                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"), 3))
                                                                                                                                        {
                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobilenotes"), 3))
                                                                                                                                          {
                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.pdfs"), 3))
                                                                                                                                            {
                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.documents"), 3))
                                                                                                                                              {
                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.google.chrome.ios"), 3))
                                                                                                                                                {
                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.developer"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.google.maps"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.directories"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("baidu_comp"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("baidu_search"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.reminders"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.dictionary"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("siri_comp"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.google.photos"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.ibooks"), 3))
                                                                                                                                                                      {
                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.linkedin.linkedin"), 3))
                                                                                                                                                                        {
                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.numbers"), 3))
                                                                                                                                                                          {
                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mobiletimer"), 3))
                                                                                                                                                                            {
                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.pandora"), 3))
                                                                                                                                                                              {
                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"), 3))
                                                                                                                                                                                {
                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.mlb.atbatuniversal"), 3))
                                                                                                                                                                                  {
                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.yahoo.aerogram"), 3))
                                                                                                                                                                                    {
                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.getdropbox.dropbox"), 3))
                                                                                                                                                                                      {
                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.lookup.search-through"), 3))
                                                                                                                                                                                        {
                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.calendar"), 3))
                                                                                                                                                                                          {
                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.airbnb.app"), 3))
                                                                                                                                                                                            {
                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.stubhub.stubhub"), 3))
                                                                                                                                                                                              {
                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.groupon.grouponapp"), 3))
                                                                                                                                                                                                {
                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.calculator"), 3))
                                                                                                                                                                                                  {
                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("tv.twitch"), 3))
                                                                                                                                                                                                    {
                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.keynote"), 3))
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.zillow.zillowmap"), 3))
                                                                                                                                                                                                        {
                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.voicememos"), 3))
                                                                                                                                                                                                          {
                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.quickwebsitesearch"), 3))
                                                                                                                                                                                                            {
                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.image_search.msgs-zkw"), 3))
                                                                                                                                                                                                              {
                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.safari.completionlist.searchsuggestionprovider"), 3))
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.searchd.zkw.suggestion"), 3))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.other:search_siri"), 3))
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("switch_to_tab"), 3))
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.Safari.CompletionList.WebsiteSpecificSearch"), 3))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.siri"), 3))
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.contacts"), 3))
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.itunes.iossoftware"), 3))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.maps"), 3))
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.wiki"), 3))
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.kg"), 3))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.news"), 3))
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.weather"), 3))
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.searchd.searchthroughsuggestions"), 3))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"), 3))
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.parsec"), 3))
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.related_search_as_typed.web"), 3))
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.tophits"), 3))
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.spotlight.related_search"), 3))
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.tophit"), 3))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion"), 3))
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.vip"), 3))
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.usertyped"), 3))
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.messageresult"), 3))
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.messagelist"), 3))
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.parsec.entity"), 3))
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.date"), 3))
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.free_text"), 3))
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.attachment"), 3))
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.people"), 3))
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.contact"), 3))
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.mailbox"), 3))
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.flag"), 3))
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.subject"), 3))
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.location"), 3))
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.document"), 3))
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.link"), 3))
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.1papplication"), 3))
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.3papplication"), 3))
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.sendercontains"), 3))
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.topiccontains"), 3))
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.suggestion.instantanswer"), 3))
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Albums"), 3))
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Caption"), 3))
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Categories"), 3))
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Dates"), 3))
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.ImportedByApp"), 3))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Keywords"), 3))
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.MediaType"), 3))
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Memories"), 3))
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Moments"), 3))
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Ocr"), 3))
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.People"), 3))
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Places"), 3))
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Title"), 3))
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.TopResults"), 3))
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.Generic"), 3))
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.Place"), 3))
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Date"), 3))
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Meaning"), 3))
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Person"), 3))
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Place"), 3))
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.Season"), 3))
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.SocialGroup"), 3))
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.UnnamedPerson"), 3))
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.flight"), 3))
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.lodging"), 3))
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.Trip"), 3))
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.AllResults"), 3))
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.UserGeneratedText"), 3))
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.PublicEvent"), 3))
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.ActionCam"), 3))
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.Spatial"), 3))
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions.Filename"), 3))
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.zkw.prompt"), 3))
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v17, "compare:options:", CFSTR("com.apple.photos.suggestions"), 3))
                                                                                                                                                                                                                                                                                                                                                                            goto LABEL_195;
                                                                                                                                                                                                                                                                                                                                                                          v18 = 179;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          v18 = 178;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        v18 = 177;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      v18 = 176;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    v18 = 175;
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  v18 = 174;
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                v18 = 173;
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              v18 = 172;
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            v18 = 171;
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          v18 = 170;
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        v18 = 169;
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      v18 = 168;
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    v18 = 167;
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  v18 = 166;
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                v18 = 165;
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              v18 = 164;
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            v18 = 163;
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          v18 = 162;
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        v18 = 161;
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      v18 = 160;
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    v18 = 159;
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  v18 = 158;
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                v18 = 157;
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              v18 = 156;
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            v18 = 155;
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          v18 = 154;
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        v18 = 153;
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      v18 = 152;
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    v18 = 151;
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  v18 = 150;
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                v18 = 149;
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              v18 = 148;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            v18 = 147;
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          v18 = 146;
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        v18 = 145;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      v18 = 144;
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    v18 = 143;
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  v18 = 142;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                v18 = 141;
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              v18 = 140;
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            v18 = 139;
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          v18 = 138;
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        v18 = 137;
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      v18 = 136;
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    v18 = 135;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v18 = 134;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v18 = 133;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v18 = 132;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v18 = 131;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v18 = 130;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v18 = 129;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v18 = 128;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v18 = 127;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v18 = 126;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v18 = 125;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v18 = 124;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v18 = 123;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v18 = 122;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v18 = 121;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v18 = 120;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v18 = 119;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v18 = 118;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v18 = 117;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v18 = 116;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v18 = 115;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v18 = 114;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v18 = 113;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v18 = 112;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v18 = 111;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v18 = 110;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v18 = 109;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v18 = 108;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v18 = 107;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v18 = 106;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v18 = 105;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v18 = 104;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v18 = 103;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v18 = 102;
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v18 = 101;
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v18 = 100;
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v18 = 99;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v18 = 98;
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v18 = 97;
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v18 = 96;
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v18 = 95;
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  v18 = 94;
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                v18 = 93;
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v18 = 92;
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            v18 = 91;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v18 = 90;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        v18 = 89;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v18 = 88;
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    v18 = 87;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v18 = 86;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v18 = 85;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v18 = 84;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v18 = 83;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v18 = 82;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v18 = 81;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v18 = 80;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v18 = 79;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v18 = 78;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v18 = 77;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v18 = 76;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v18 = 75;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v18 = 74;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v18 = 73;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v18 = 72;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v18 = 71;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v18 = 70;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v18 = 69;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v18 = 68;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v18 = 67;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v18 = 66;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v18 = 65;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v18 = 64;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v18 = 63;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v18 = 62;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v18 = 61;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v18 = 60;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v18 = 59;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v18 = 58;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v18 = 57;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v18 = 56;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v18 = 55;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v18 = 54;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v18 = 53;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v18 = 52;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v18 = 51;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v18 = 50;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v18 = 49;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v18 = 48;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v18 = 47;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v18 = 46;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v18 = 45;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v18 = 44;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v18 = 43;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v18 = 42;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v18 = 41;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v18 = 40;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v18 = 39;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v18 = 38;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v18 = 37;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v18 = 36;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v18 = 35;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v18 = 34;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v18 = 33;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v18 = 32;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v18 = 31;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v18 = 30;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v18 = 29;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v18 = 28;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v18 = 27;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v18 = 26;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v18 = 25;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v18 = 24;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v18 = 23;
                                                  }
                                                }
                                                else
                                                {
                                                  v18 = 22;
                                                }
                                              }
                                              else
                                              {
                                                v18 = 21;
                                              }
                                            }
                                            else
                                            {
                                              v18 = 20;
                                            }
                                          }
                                          else
                                          {
                                            v18 = 19;
                                          }
                                        }
                                        else
                                        {
                                          v18 = 18;
                                        }
                                      }
                                      else
                                      {
                                        v18 = 17;
                                      }
                                    }
                                    else
                                    {
                                      v18 = 16;
                                    }
                                  }
                                  else
                                  {
                                    v18 = 15;
                                  }
                                }
                                else
                                {
                                  v18 = 14;
                                }
                              }
                              else
                              {
                                v18 = 13;
                              }
                            }
                            else
                            {
                              v18 = 12;
                            }
                          }
                          else
                          {
                            v18 = 11;
                          }
                        }
                        else
                        {
                          v18 = 10;
                        }
                      }
                      else
                      {
                        v18 = 9;
                      }
                    }
                    else
                    {
                      v18 = 8;
                    }
                  }
                  else
                  {
                    v18 = 7;
                  }
                }
                else
                {
                  v18 = 6;
                }
              }
              else
              {
                v18 = 5;
              }
            }
            else
            {
              v18 = 4;
            }
          }
        }
        else
        {
          v18 = 2;
        }
      }
      else
      {
        v18 = 1;
      }

      -[_CPResultSectionForFeedback setKnownBundleIdentifier:](v5, "setKnownBundleIdentifier:", v18);
      goto LABEL_375;
    }
LABEL_195:

    objc_msgSend(v4, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[_CPResultSectionForFeedback setBundleIdentifier:](v5, "setBundleIdentifier:", v20);

  }
LABEL_375:
  -[_CPResultSectionForFeedback setIsInitiallyHidden:](v5, "setIsInitiallyHidden:", objc_msgSend(v4, "isInitiallyHidden"));
  -[_CPResultSectionForFeedback setTotalAvailableResults:](v5, "setTotalAvailableResults:", objc_msgSend(v4, "totalAvailableResults"));
  objc_msgSend(v4, "titleButtonItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [_CPButtonForFeedback alloc];
    objc_msgSend(v4, "titleButtonItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_CPButtonForFeedback initWithFacade:](v22, "initWithFacade:", v23);
    -[_CPResultSectionForFeedback setTitleButtonItem:](v5, "setTitleButtonItem:", v24);

  }
  v25 = v5;

LABEL_378:
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_results;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[_CPResultSectionForFeedback identifier](self, "identifier", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_CPResultSectionForFeedback rankingScore](self, "rankingScore");
  if (v11 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_CPResultSectionForFeedback fallbackResultSection](self, "fallbackResultSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteDataField();
  -[_CPResultSectionForFeedback bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  if (-[_CPResultSectionForFeedback knownBundleIdentifier](self, "knownBundleIdentifier"))
    PBDataWriterWriteInt32Field();
  if (-[_CPResultSectionForFeedback isInitiallyHidden](self, "isInitiallyHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_CPResultSectionForFeedback totalAvailableResults](self, "totalAvailableResults"))
    PBDataWriterWriteUint32Field();
  -[_CPResultSectionForFeedback titleButtonItem](self, "titleButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_CPResultSectionForFeedback titleButtonItem](self, "titleButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (unsigned)totalAvailableResults
{
  return self->_totalAvailableResults;
}

- (_CPButtonForFeedback)titleButtonItem
{
  return self->_titleButtonItem;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (int)knownBundleIdentifier
{
  if (self->_whichBundleid == 2)
    return self->_knownBundleIdentifier;
  else
    return 0;
}

- (BOOL)isInitiallyHidden
{
  return self->_isInitiallyHidden;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)fallbackResultSection
{
  return self->_fallbackResultSection;
}

- (NSString)bundleIdentifier
{
  if (self->_whichBundleid == 1)
    return self->_bundleIdentifier;
  else
    return (NSString *)0;
}

- (void)setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  results = self->_results;
  self->_results = v4;

}

- (void)setTotalAvailableResults:(unsigned int)a3
{
  self->_totalAvailableResults = a3;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (void)setIsInitiallyHidden:(BOOL)a3
{
  self->_isInitiallyHidden = a3;
}

- (void)addResults:(id)a3
{
  id v4;
  NSArray *results;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  results = self->_results;
  v8 = v4;
  if (!results)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_results;
    self->_results = v6;

    v4 = v8;
    results = self->_results;
  }
  -[NSArray addObject:](results, "addObject:", v4);

}

- (void)setKnownBundleIdentifier:(int)a3
{
  -[_CPResultSectionForFeedback clearBundleid](self, "clearBundleid");
  self->_whichBundleid = 2;
  self->_knownBundleIdentifier = a3;
}

- (void)clearBundleid
{
  NSString *bundleIdentifier;

  self->_whichBundleid = 0;
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  self->_knownBundleIdentifier = 0;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackResultSection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)clearResults
{
  -[NSArray removeAllObjects](self->_results, "removeAllObjects");
}

- (unint64_t)resultsCount
{
  return -[NSArray count](self->_results, "count");
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;
  id v6;

  v6 = a3;
  -[_CPResultSectionForFeedback clearBundleid](self, "clearBundleid");
  self->_whichBundleid = v6 != 0;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _CPResultSectionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double rankingScore;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int knownBundleIdentifier;
  int isInitiallyHidden;
  unsigned int totalAvailableResults;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_CPResultSectionForFeedback results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_CPResultSectionForFeedback results](self, "results");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPResultSectionForFeedback results](self, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPResultSectionForFeedback identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_CPResultSectionForFeedback identifier](self, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPResultSectionForFeedback identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_31;
  }
  else
  {

  }
  rankingScore = self->_rankingScore;
  objc_msgSend(v4, "rankingScore");
  if (rankingScore != v18)
    goto LABEL_31;
  -[_CPResultSectionForFeedback fallbackResultSection](self, "fallbackResultSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fallbackResultSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_CPResultSectionForFeedback fallbackResultSection](self, "fallbackResultSection");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPResultSectionForFeedback fallbackResultSection](self, "fallbackResultSection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fallbackResultSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPResultSectionForFeedback bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_CPResultSectionForFeedback bundleIdentifier](self, "bundleIdentifier");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_CPResultSectionForFeedback bundleIdentifier](self, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_31;
  }
  else
  {

  }
  knownBundleIdentifier = self->_knownBundleIdentifier;
  if (knownBundleIdentifier != objc_msgSend(v4, "knownBundleIdentifier"))
    goto LABEL_31;
  isInitiallyHidden = self->_isInitiallyHidden;
  if (isInitiallyHidden != objc_msgSend(v4, "isInitiallyHidden"))
    goto LABEL_31;
  totalAvailableResults = self->_totalAvailableResults;
  if (totalAvailableResults != objc_msgSend(v4, "totalAvailableResults"))
    goto LABEL_31;
  -[_CPResultSectionForFeedback titleButtonItem](self, "titleButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[_CPResultSectionForFeedback titleButtonItem](self, "titleButtonItem");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_34:
    v37 = 1;
    goto LABEL_32;
  }
  v33 = (void *)v32;
  -[_CPResultSectionForFeedback titleButtonItem](self, "titleButtonItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleButtonItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_34;
LABEL_31:
  v37 = 0;
LABEL_32:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  double rankingScore;
  NSUInteger v6;
  double v7;
  long double v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSArray hash](self->_results, "hash");
  v4 = -[NSString hash](self->_identifier, "hash");
  rankingScore = self->_rankingScore;
  v6 = v4 ^ v3;
  v7 = -rankingScore;
  if (rankingScore >= 0.0)
    v7 = self->_rankingScore;
  v8 = round(v7);
  v9 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  v10 = -[NSData hash](self->_fallbackResultSection, "hash");
  v11 = -[NSString hash](self->_bundleIdentifier, "hash");
  v12 = 2654435761 * self->_knownBundleIdentifier;
  v13 = 2654435761 * self->_isInitiallyHidden;
  v14 = 2654435761 * self->_totalAvailableResults;
  return v6 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[_CPButtonForFeedback hash](self->_titleButtonItem, "hash") ^ v9;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setFallbackResultSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTitleButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_titleButtonItem, a3);
}

- (unint64_t)whichBundleid
{
  return self->_whichBundleid;
}

@end
